computeBeta2d <- function(tParCount = 11,
                          sampleSize = 10,
                          sigma = 2,
                          lag = 2,
                          noise = NULL,
                          bDegree = 1/13,
                          bConst = 0.1,
                          mConst = 1,
                          bDegreeForGamma = 1/4)
{
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  bandWidth <- computeBOBM(sampleSize, bDegree, bConst)
  batchSize <- computeBatchSize(sampleSize, mConst)

  tParArray <- createTParArray(tParCount)

  sandboxBounds <- createNewTParArrayIndex(tParArray = tParArray,
                                           bandWidth = bandWidth)
  if((sandboxBounds[2] - sandboxBounds[1]) < 0){
    warning("The number of elements in the sandbox is less than zero.
            Use a larger sample size.")
    return(NULL)
  }

  diagHorizSamplePair <- createDiagHorSamples(sampleSize, tParCount,
                                              mean = 0, sigma = sigma,
                                              noise = noise,
                                              type = "ScaledNoise")

  diagonalSample <- diagHorizSamplePair[[2]]
  horizontal2dSample <- diagHorizSamplePair[[1]]

  diagonal2dBeta <- array(data = 0, dim = c(sampleSize,
                                            (sandboxBounds[2] - sandboxBounds[1])+1))
  horizontal2dBeta <- array(data = 0, dim = c(sampleSize,
                                              (sandboxBounds[2] - sandboxBounds[1])+1))

  for(tIndex in sandboxBounds[1]:sandboxBounds[2]){
    diagonal2dBeta[, (tIndex - sandboxBounds[1] + 1)] <- computeBetaMatrixColumnHat(
                                                                  diagonalSample,
                                                                  lag = lag,
                                                                  tPar = tParArray[tIndex],
                                                                  bDegreeForGamma)

    horizontal2dBeta[, (tIndex - sandboxBounds[1] + 1)] <- computeBetaMatrixColumnHat(
                                                                horizontal2dSample[tIndex,],
                                                                lag = lag,
                                                                tPar = tParArray[tIndex],
                                                                bDegreeForGamma)
  }

  samples <- list(horizontal2dBeta, diagonal2dBeta)

  beta2dHeatMap(samples = samples, tParArray = tParArray,
                sampleSize = sampleSize,
                bounds = sandboxBounds[1]:sandboxBounds[2])

  beta2dGraph3d(samples = samples, tParArray = tParArray,
                sampleSize = sampleSize,
                bounds = sandboxBounds[1]:sandboxBounds[2])

  csvFileNameHoriz <- "output/csvHorizontalBeta"
  csvExport(infoArray = horizontal2dBeta,
            fileNameCSV = csvFileNameHoriz, rowNames = T)

  csvFileNameDiag <- "output/csvDiagonalBeta"
  csvExport(infoArray = diagonal2dBeta,
            fileNameCSV = csvFileNameDiag, rowNames = T)
}
