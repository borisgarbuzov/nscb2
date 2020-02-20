squared2dBetaBenchmark <- function(minSampleSize = 100,
                                   maxSampleSize = 1000,
                                   sampleSizeStep = 100,
                                   sigma = 2,
                                   lag = 2,
                                   noise = NULL,
                                   mConst = 1,
                                   bDegreeForGamma = 1/4)
{
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  sampleSizeArray = seq(from = minSampleSize, to = maxSampleSize,
                        by = sampleSizeStep)

  timeForEveryIter <- c()
  numberOfIter <- c()

  for(sampleSize in sampleSizeArray){
    tParArray <- createTParArray(sampleSize)

    diagHorizSamplePair <- createDiagHorSamples(sampleSize = sampleSize,
                                                tParCount = sampleSize,
                                                mean = 0, sigma = sigma,
                                                noise = noise,
                                                type = "ScaledNoise")

    diagonalSample <- diagHorizSamplePair[[2]]
    horizontal2dSample <- diagHorizSamplePair[[1]]

    diagonal2dBeta <- array(data = 0, dim = c(sampleSize, length(tParArray)))
    horizontal2dBeta <- array(data = 0, dim = c(sampleSize, length(tParArray)))

    startCycleTime <- Sys.time()
    for(tIndex in seq(tParArray)){

      diagonal2dBeta[, tIndex] <- computeBetaMatrixColumnHat(
        diagonalSample,
        lag = lag,
        tPar = tParArray[tIndex],
        bDegreeForGamma)

      horizontal2dBeta[, tIndex] <- computeBetaMatrixColumnHat(
        horizontal2dSample[tIndex,],
        lag = lag,
        tPar = tParArray[tIndex],
        bDegreeForGamma)

    }
    deltaTime <- difftime(Sys.time(), startCycleTime, units = "secs")
    timeForEveryIter <- c(timeForEveryIter, deltaTime)
    numberOfIter <- c(numberOfIter, sampleSize)

    finalInfo <- cbind(numberOfIter, timeForEveryIter)
    colnames(finalInfo) <- c("Iteration", "Time")
    fileName <- paste0("output/TimeFor2dBeta", sampleSize)
    csvExport(infoArray = finalInfo, fileNameCSV = fileName, graph = T)

    csvFileNameHoriz <- paste0("output/csvHorizontalBeta", sampleSize)
    csvExport(infoArray = horizontal2dBeta,
              fileNameCSV = csvFileNameHoriz, rowNames = T)

    csvFileNameDiag <- paste0("output/csvDiagonalBeta", sampleSize)
    csvExport(infoArray = diagonal2dBeta,
              fileNameCSV = csvFileNameDiag, rowNames = T)

    cat("Current size =", sampleSize, "\n")
  }
}
