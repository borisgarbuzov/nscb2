scenario4BetaSingleN <- function(tParCount = 30,
                                 sampleSize = 1000,
                                 sigma = 2,
                                 maxLag = 8,
                                 lag = 2,
                                 pictureWidth = 2000,
                                 pictureHeight = 1000,
                                 mySeed = "random",
                                 typeOfKernel = "gaussian",
                                 noise = NULL,
                                 bDegree = 1/13,
                                 bConst = 0.01,
                                 mConst = 1,
                                 diagHorizSamplePair = NULL,
                                 bDegreeForGamma = 1/4)
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
  bandWidth <- computeBOBM(sampleSize, bDegree, bConst)
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
    trueLrvArray[(tIndex - sandboxBounds[1] + 1)] <- computeTrueBetaLrv(sigma = sigma,
                                                                   tPar = tParArray[tIndex],
                                                                   type = "ScaledNoise")

    "Create diagonal Beta Matrix"
    diagonalBetaColumn <- computeBetaMatrixColumnHat(diagonalSample,
                                                     lag = lag,
                                                     tPar = tParArray[tIndex],
                                                     bDegreeForGamma)

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
    horizontalBetaColumn <- computeBetaMatrixColumnHat(horizontal2dSample[tIndex,],
                                                       lag = lag,
                                                       tPar = tParArray[tIndex],
                                                       bDegreeForGamma)

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
    cat("There are (", sandboxBounds[2]-tIndex,
        ") iterations left until the end of the program\n")
  }
  "Make the name of the output graph"
  nameOfFile <- paste0("output/BetaMatrixSingleN(bConst=", bConst, ",mConst=", mConst,
                       ",lag=", lag,
                       ",maxLag=", maxLag,
                       ",sampleSize=", sampleSize,
                       ",tParCount=", tParCount,").svg")

  "Create an output graph of the estimated and
  true LRV dependence on the parameter t"
  createLrvPlotScenario4SingleN(lrvXArray = diagonalLrvArray,
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
                                mySeed = seed,
                                lag = lag)

  infoArray <- list(diagonalLrv = diagonalLrvArray,
                    horizontalLrv = horizontalLrvArray, trueLrv = trueLrvArray,
                    tParArray = tParArray[sandboxBounds[1]:sandboxBounds[2]])
  csvExport(infoArray = infoArray, fileNameCSV = sub(".svg", "", nameOfFile))
}
