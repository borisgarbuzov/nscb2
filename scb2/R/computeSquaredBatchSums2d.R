computeSquaredBatchSums2d <- function(tParCount = 11,
                                      sampleSize = 10,
                                      sigma = 2,
                                      lag = 2,
                                      noise = NULL,
                                      bDegree = 1/13,
                                      bConst = 0.1,
                                      mConst = 1,
                                      bDegreeForGamma = 1/4){
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

  diagonal2dSquaredBatchSums <- array(data = 0, dim = c(sampleSize-(batchSize+1),
                                                        (sandboxBounds[2] - sandboxBounds[1])+1))
  horizontal2dSquaredBatchSums <- array(data = 0, dim = c(sampleSize-(batchSize+1),
                                                          (sandboxBounds[2] - sandboxBounds[1])+1))

  for(tIndex in sandboxBounds[1]:sandboxBounds[2]){
    diagonalBetaColumn <- computeBetaMatrixColumnHat(diagonalSample,
                                                     lag = lag,
                                                     tPar = tParArray[tIndex],
                                                     bDegreeForGamma)

    diagonal2dSquaredBatchSums[, (tIndex - sandboxBounds[1] + 1)] <- sampleSplit(
      sample = diagonalBetaColumn,
      batchSize = batchSize)

    horizontalBetaColumn <- computeBetaMatrixColumnHat(horizontal2dSample[tIndex,],
                                                       lag = lag,
                                                       tPar = tParArray[tIndex],
                                                       bDegreeForGamma)

    horizontal2dSquaredBatchSums[, (tIndex - sandboxBounds[1] + 1)] <- sampleSplit(
      sample = horizontalBetaColumn,
      batchSize = batchSize)
  }

  samples <- list(horizontal2dSquaredBatchSums, diagonal2dSquaredBatchSums)

  squaredBatchSums2dHeatMap(samples = samples, tParArray = tParArray,
                            sampleSize = sampleSize-(batchSize+1),
                            bounds = sandboxBounds[1]:sandboxBounds[2])

  squaredBatchSums2dGraph3d(samples = samples, tParArray = tParArray,
                            sampleSize = sampleSize-(batchSize+1),
                            bounds = sandboxBounds[1]:sandboxBounds[2])
}
