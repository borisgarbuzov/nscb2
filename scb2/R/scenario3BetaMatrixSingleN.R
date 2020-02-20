scenario3BetaMatrixSingleN <- function(tParCount = 100,
                                       sampleSize = 1000,
                                       sigma = 2,
                                       maxLag = 8,
                                       lag = 2,
                                       pictureWidth = 2000,
                                       pictureHeight = 1000,
                                       mySeed = "random",
                                       typeOfKernel = "gaussian",
                                       noise = NULL,
                                       bDegree = -0.26,
                                       bConst = 1,
                                       mConst = 1,
                                       diagHorizSamplePair = NULL)
{
  "Check if this directory exists"
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  "Set a logical variable to display whether the seed is fixed or not in the legend"
  if(mySeed == "random"){
    set.seed(NULL)
    seed <- F
  }else{
    set.seed(mySeed)
    seed <- T
  }

  "Check the length of the supplied noise (if it is not null)"
  if(!is.null(noise)){
    if(length(noise) != (sampleSize)){
      warning("length of noise must be (sampleSize)")
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
  sandboxBounds <- createNewTParArrayIndex(tParArray = tParArray,
                                               bandWidth = bandWidth)
  if((sandboxBounds[2] - sandboxBounds[1]) < 0){
    warning("The number of elements in the sandbox is less than zero.
            Use a larger sample size.")
    return(NULL)
  }

  "Create a diagonal and horizontal selection"
  if(is.null(diagHorizSamplePair)){
    diagHorizSamplePair <- createDiagHorSamples(sampleSize, tParCount,
                                   mean = 0, sigma = sigma, noise,
                                   type = "ScaledNoise")
  }

  diagonalSample <- diagHorizSamplePair[[2]]
  horizontal2dSample <- diagHorizSamplePair[[1]]


  "Preparing arrays for LRVHat and TrueLRV"
  diagonalLrvArray <- array(data = 0, dim = (sandboxBounds[2] - sandboxBounds[1]))
  horizontalLrvArray <- array(data = 0, dim = (sandboxBounds[2] - sandboxBounds[1]))
  trueLrvArray <- array(data = 0, dim = (sandboxBounds[2] - sandboxBounds[1]))

  "For each option from the sandbox..."
  for(tIndex in sandboxBounds[1]:sandboxBounds[2]){
    "Calculate trueLRV"
    trueLrvArray[(tIndex - sandboxBounds[1] + 1)] <- computeTrueLrv(sigma = sigma,
                                                                   tPar = tParArray[tIndex],
                                                                   type = "ScaledNoise")

    "Create diagonal Beta Matrix"
    diagonalBetaColumn <- computeBetaColumnScaledNoise(diagonalSample,
                                           psi = customCoefFunction(tIndex/sampleSize),
                                           sigma = sigma,
                                           lag = lag,
                                           tPar = tParArray[tIndex])

    "Count the squares of the block sums"
    diagonalSquaredBatchSumArray <- sampleSplit(sample = diagonalBetaColumn,
                                                batchSize = batchSize)

    newSampleSize <- length(diagonalSquaredBatchSumArray)

    "Calculate the LRV for the diagonal sample"
    diagonalLrvArray[(tIndex - sandboxBounds[1] + 1)] <- computeKernelLrvHatForSingleTPar(newSampleSize,
                                                                                  diagonalSquaredBatchSumArray,
                                                                                  tParArray[tIndex],
                                                                                  batchSize,
                                                                                  bandWidth,
                                                                                  typeOfKernel)

    "Create diagonal Beta Matrix"
    horizontalBetaColumn <- computeBetaColumnScaledNoise(horizontal2dSample[tIndex,],
                                              psi = customCoefFunction(tIndex/sampleSize),
                                              sigma = sigma,
                                              lag = lag,
                                              tPar = tParArray[tIndex])

    "Calculate the squares of the block sums of the horizontal sample"
    horizontalSquaredBatchSumArray <- sampleSplit(sample = horizontalBetaColumn,
                                                  batchSize = batchSize)

    newSampleSize <- length(horizontalSquaredBatchSumArray)

    "Calculate the LRV for the horizontal sample"
    horizontalLrvArray[(tIndex - sandboxBounds[1] + 1)] <- computeKernelLrvHatForSingleTPar(newSampleSize,
                                                                                  horizontalSquaredBatchSumArray,
                                                                                  tParArray[tIndex],
                                                                                  batchSize,
                                                                                  bandWidth,
                                                                                  typeOfKernel)
  }
  "Make the name of the output graph"
  nameOfFile <- paste0("output/BetaMatrixSingleN(bConst=", bConst, ",mConst=", mConst,
                       ",lag=", lag,
                       ",maxLag=", maxLag,
                       ",sampleSize=", sampleSize,
                       ",tParCount=", tParCount,").svg")

  "Create an output graph of the estimated and
  true LRV dependence on the parameter t"
  createLrvPlotScenario3SingleN(lrvXArray = diagonalLrvArray,
                                lrvYArray = horizontalLrvArray,
                                trueLrvArray = trueLrvArray,
                                tParArray = tParArray[sandboxBounds[1]:sandboxBounds[2]],
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
