scenario3SingleN <- function(tParCount = 100,
                             sampleSize = 1000,
                             sd = 2,
                             pictureWidth = 2000,
                             pictureHeight = 1000,
                             isSeed = "random",
                             typeOfKernel = "gaussian",
                             noise = NULL,
                             bDegree = -0.26,
                             bConst = 1,
                             mConst = 1,
                             samples = NULL)
  {
  "Check if this directory exists"
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  "Set a logical variable to display whether the seed is fixed or not in the legend"
  if(isSeed == "random"){
    set.seed(NULL)
    seed <- F
  }else{
    set.seed(isSeed)
    seed <- T
  }

  "Check the length of the supplied noise (if it is not null)"
  if(!is.null(noise)){
    if(length(noise) != (sampleSize + 1)){
      warning("length of noise must be (sampleSize + 1)")
      exit()
    }
  }

  "Fix the beginning of calculations to show
  on the chart how much time it took for the program to work"
  startTime <- Sys.time()

  "Calculate b and m for a given sample size"
  bandWidth <- computeB(sampleSize, bDegree, bConst)
  batchSize <- computeBatchSize(sampleSize, mConst)

  "Take the degrees by which b and m were calculated, and then display it on the graph"
  bandWidthDegree <- getDegree(bDegree)
  batchSizeDegree <- getDegreeForBatchSize()

  "Take the constants by which b and m"

  "Create an array of parameters t"
  tParArray <- createTParArray(tParCount)

  "Define the boundaries of the sandbox"
  newTParArrayIndex <- createNewTParArrayIndex(tParArray = tParArray,
                                               bandWidth = bandWidth)
  if((newTParArrayIndex[2] - newTParArrayIndex[1]) < 0){
    warning("The number of elements in the sandbox is less than zero.
            Use a larger sample size.")
    return(NULL)
  }

  "Create a diagonal and horizontal selection"
  if(is.null(samples)){
    samples <- createDiagHorSamples(sampleSize, tParCount, mean = 0, sigma = sd, noise)
  }

  horizontal2dSample <- samples[[1]]
  diagonalSample <- samples[[2]]

  "Count the squares of the block sums"
  diagonalSquaredBatchSumArray <- sampleSplit(sample = diagonalSample,
                                             batchSize = batchSize)


  "Preparing arrays for LRVHat and TrueLRV"
  lrvXArray <- array(data = 0, dim = (newTParArrayIndex[2] - newTParArrayIndex[1]))
  lrvYArray <- array(data = 0, dim = (newTParArrayIndex[2] - newTParArrayIndex[1]))
  trueLrvArray <- array(data = 0, dim = (newTParArrayIndex[2] - newTParArrayIndex[1]))

  "For each option from the sandbox..."
  for(i in newTParArrayIndex[1]:newTParArrayIndex[2]){
    "Calculate trueLRV"
    trueLrvArray[(i - newTParArrayIndex[1] + 1)] <- computeTrueLrv(sigma = sd,
                                                                   tPar = tParArray[i])

    "Calculate the LRV for the diagonal sample"
    lrvXArray[(i - newTParArrayIndex[1] + 1)] <- computeKernelLrvHatForSingleTPar(sampleSize-batchSize+1,
                                                                                  diagonalSquaredBatchSumArray,
                                                                                  tParArray[i],
                                                                                  batchSize,
                                                                                  bandWidth,
                                                                                  typeOfKernel)

    "Calculate the squares of the block sums of the horizontal sample"
    horizontalSquaredBatchSumArray <- sampleSplit(sample = horizontal2dSample[i,],
                                                  batchSize = batchSize)

    "Calculate the LRV for the horizontal sample"
    lrvYArray[(i - newTParArrayIndex[1] + 1)] <- computeKernelLrvHatForSingleTPar(sampleSize-batchSize+1,
                                                                                  horizontalSquaredBatchSumArray,
                                                                                  tParArray[i],
                                                                                  batchSize,
                                                                                  bandWidth,
                                                                                  typeOfKernel)
  }
  "Make the name of the output graph"
  nameOfFile <- paste0("output/SingleN(bConst=", bConst, ",mConst=", mConst, ").svg")

  "Create an output graph of the estimated and
  true LRV dependence on the parameter t"
  createLrvPlotScenario3SingleN(lrvXArray = lrvXArray,
                                lrvYArray = lrvYArray,
                                trueLrvArray = trueLrvArray,
                                tParArray = tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]],
                                sampleSize = sampleSize,
                                fileName = nameOfFile,
                                bConst = bConst,
                                mConst = mConst,
                                b = bandWidth,
                                m = batchSize,
                                startTime = startTime,
                                bandWidthDegree = bandWidthDegree,
                                batchSizeDegree = batchSizeDegree,
                                mySeed = seed)
}

