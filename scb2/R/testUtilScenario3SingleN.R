testUtilScenario3SingleN <- function(tParCount = 11,
                                     sampleSize = 10,
                                     sigma = 2,
                                     pictureWidth = 2000,
                                     pictureHeight = 1000,
                                     isSeed = "random",
                                     typeOfKernel = "gaussian",
                                     noise = NULL,
                                     bDegree = -0.5,
                                     bConst = 1,
                                     mConst = 1) {
  cat("\n Testing \'tests_scb2_150_scenario3SingleN\ \n")

  cat("\nTest parameters :", "\n")

  cat(" tParCount = ", tParCount, "\n")
  cat(" sampleSize = ", sampleSize, "\n")
  cat(" sigma = ", sigma, "\n")
  cat(" pictureWidth = ", pictureWidth, "\n")
  cat(" pictureHeight = ", pictureHeight, "\n")
  cat(" isSeed = ", isSeed, "\n")
  cat(" typeOfKernel = ", typeOfKernel, "\n")
  cat(" noise = ", noise, "\n")
  cat(" bDegree = ", bDegree, "\n")

  Start <- Sys.time()

  scenario3SingleN(tParCount,
                  sampleSize,
                  sigma,
                  pictureWidth,
                  pictureHeight,
                  isSeed,
                  typeOfKernel,
                  noise,
                  bDegree,
                  bConst = bConst,
                  mConst = mConst)

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

  "Calculate b and m for a given sample size"
  bandWidth <- computeB(sampleSize, bDegree)
  bandWidthDegree <- getDegree(bDegree)
  batchSize <- computeBatchSize(sampleSize)
  batchSizeDegree <- getDegreeForBatchSize()

  "Fix the beginning of calculations to show
  on the chart how much time it took for the program to work"
  startTime <- Sys.time()

  "Create an array of parameters t"
  tParArray <- createTParArray(tParCount)

  "Define the boundaries of the sandbox"
  newTParArrayIndex <- createNewTParArrayIndex(tParArray = tParArray,
                                               bandWidth = bandWidth)

  "Create a diagonal and horizontal selection"
  diagonalSample <- array(data = 0, dim=sampleSize)

  if(is.null(noise)){
    noise <- rnorm(n = sampleSize+1,
                   mean = 0,
                   sd = sigma)
  }

  for(i in 1:sampleSize){
    diagonalSample[i] <- customCoefFunction(i/sampleSize)*noise[i] + noise[(i+1)]
  }

  horizontal2dSample <- array(data = 0, dim = c(tParCount, sampleSize))

  for(i in 1:tParCount){
    for(j in 1:sampleSize){
      horizontal2dSample[i,j] <- customCoefFunction(i/tParCount)*noise[j]+noise[(j+1)]
    }
  }

  "Count the squares of the block sums"
  diagonalSquaredBatchSumArray <- array(data = 0, dim = sampleSize-batchSize+1)

  for(i in 1:(sampleSize-batchSize+1)){
    diagonalSquaredBatchSumArray[i] <- (sum(diagonalSample[i:(i+batchSize-1)]))^2
  }


  "Preparing arrays for LRVHat and TrueLRV"
  lrvXArray <- array(data = 0, dim = (newTParArrayIndex[2] - newTParArrayIndex[1]))
  lrvYArray <- array(data = 0, dim = (newTParArrayIndex[2] - newTParArrayIndex[1]))
  trueLrvArray <- array(data = 0, dim = (newTParArrayIndex[2] - newTParArrayIndex[1]))


  "For each option from the sandbox..."
  for(i in newTParArrayIndex[1]:newTParArrayIndex[2]){
    "Calculate trueLRV"
    trueLrvArray[(i - newTParArrayIndex[1] + 1)] <- sigma^2*(1+2*customCoefFunction(tParArray[i]))
    "Calculate kernelArray"
    kernelArray <- array(data = 0, dim = (sampleSize-batchSize+1))

    for(j in 1:length(kernelArray)){
      kernelArray[j] <- customKernel((j/sampleSize - tParArray[i]), bandWidth, typeOfKernel)
    }

    "Calculate the LRV for the diagonal sample"
    lrvXArray[(i - newTParArrayIndex[1] + 1)] <- sum(diagonalSquaredBatchSumArray*kernelArray)/(batchSize*(sampleSize-batchSize+1))

    "Calculate the squares of the block sums of the horizontal sample"
    horizontalSquaredBatchSumArray <- array(data = 0, dim = sampleSize-batchSize+1)

    "Calculate the LRV for the horizontal sample"
    for(j in 1:(sampleSize-batchSize+1)){
      horizontalSquaredBatchSumArray[j] <- (sum(horizontal2dSample[i, j:(j+batchSize-1)]))^2
    }



    lrvYArray[(i - newTParArrayIndex[1] + 1)] <- sum(horizontalSquaredBatchSumArray*kernelArray)/(batchSize*(sampleSize-batchSize+1))
  }

  "Make the name of the output graph"
  nameOfFile <- paste0("output/SingleN(test)", typeOfKernel, "sampleSize=", sampleSize, ".svg")

  "Create an output graph of the estimated and
  true LRV dependence on the parameter t"
  createLrvPlotScenario3SingleN(lrvXArray = lrvXArray,
                                lrvYArray = lrvYArray,
                                trueLrvArray = trueLrvArray,
                                tParArray = tParArray[newTParArrayIndex[1]:newTParArrayIndex[2]],
                                sampleSize = sampleSize,
                                fileName = nameOfFile,
                                b = bandWidth,
                                m = batchSize,
                                startTime = startTime,
                                bandWidthDegree = bandWidthDegree,
                                batchSizeDegree = batchSizeDegree,
                                mySeed = seed)




  End <- Sys.time()
  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat(" Duration =", duration, "\n")


  cat("\n")

  cat("End of test scenario3SingleN", "\n")

  cat("=====================\n")
}
