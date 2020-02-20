pipeSampleBetaSbs <- function(tParCount = 11,
                              sampleSize = 15,
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

  #-------------sample---------------

  diagHorizSamplePair <- createDiagHorSamples(sampleSize, tParCount,
                                              mean = 0, sigma = sigma,
                                              noise = noise,
                                              type = "ScaledNoise")

  diagonalSample <- diagHorizSamplePair[[2]]
  horizontal2dSample <- diagHorizSamplePair[[1]]


  #-------------beta, sbs---------------


  diagonal2dBeta <- array(data = 0, dim = c(sampleSize,
                                            (sandboxBounds[2] - sandboxBounds[1])+1))
  horizontal2dBeta <- array(data = 0, dim = c(sampleSize,
                                              (sandboxBounds[2] - sandboxBounds[1])+1))

  diagonal2dSquaredBatchSums <- array(data = 0, dim = c(sampleSize-(batchSize+1),
                                            (sandboxBounds[2] - sandboxBounds[1])+1))
  horizontal2dSquaredBatchSums <- array(data = 0, dim = c(sampleSize-(batchSize+1),
                                              (sandboxBounds[2] - sandboxBounds[1])+1))

  for(tIndex in sandboxBounds[1]:sandboxBounds[2]){
    diagonalBetaColumn <- computeBetaMatrixColumnHat(diagonalSample,
                                                     lag = lag,
                                                     tPar = tParArray[tIndex],
                                                     bDegreeForGamma)

    diagonal2dBeta[, (tIndex - sandboxBounds[1] + 1)] <- diagonalBetaColumn

    diagonal2dSquaredBatchSums[, (tIndex - sandboxBounds[1] + 1)] <- sampleSplit(
      sample = diagonalBetaColumn,
      batchSize = batchSize)

    horizontalBetaColumn <- computeBetaMatrixColumnHat(horizontal2dSample[tIndex,],
                                                       lag = lag,
                                                       tPar = tParArray[tIndex],
                                                       bDegreeForGamma,
                                                       batchSize)

    horizontal2dBeta[, (tIndex - sandboxBounds[1] + 1)] <- horizontalBetaColumn

    horizontal2dSquaredBatchSums[, (tIndex - sandboxBounds[1] + 1)] <- sampleSplit(
      sample = horizontalBetaColumn,
      batchSize = batchSize)
  }

  # squared batch sums 3d, heatmap and csv
  samplesBeta <- list(diagonal2dBeta, horizontal2dBeta)

  beta2dHeatMap(samples = samplesBeta, tParArray = tParArray,
                sampleSize = sampleSize,
                bounds = sandboxBounds[1]:sandboxBounds[2])

  beta2dGraph3d(samples = samplesBeta, tParArray = tParArray,
                sampleSize = sampleSize,
                bounds = sandboxBounds[1]:sandboxBounds[2])

  csvFileNameHorizBeta <- "output/csvHorizontalBeta"
  csvExport(infoArray = horizontal2dBeta,
            fileNameCSV = csvFileNameHorizBeta, rowNames = T)

  csvFileNameDiagBeta <- "output/csvDiagonalBeta"
  csvExport(infoArray = diagonal2dBeta,
            fileNameCSV = csvFileNameDiagBeta, rowNames = T)

  # =================================================================

  # squared batch sums 3d, heatmap and csv
  samplesSquaredBatchSums <- list(horizontal2dSquaredBatchSums,
                                  diagonal2dSquaredBatchSums)

  squaredBatchSums2dHeatMap(samples = samplesSquaredBatchSums,
                            tParArray = tParArray,
                            sampleSize = sampleSize-(batchSize+1),
                            bounds = sandboxBounds[1]:sandboxBounds[2])

  squaredBatchSums2dGraph3d(samples = samplesSquaredBatchSums,
                            tParArray = tParArray,
                            sampleSize = sampleSize-(batchSize+1),
                            bounds = sandboxBounds[1]:sandboxBounds[2])

  csvFileNameHorizSquaredBatchSums <- "output/csvHorizontalSquaredBatchSums"
  csvExport(infoArray = horizontal2dSquaredBatchSums,
            fileNameCSV = csvFileNameHorizSquaredBatchSums, rowNames = T)

  csvFileNameDiagSquaredBatchSums <- "output/csvDiagonalSquaredBatchSums"
  csvExport(infoArray = diagonal2dSquaredBatchSums,
            fileNameCSV = csvFileNameDiagSquaredBatchSums, rowNames = T)

  # =================================================================

  # block order can be arbitrary

  # 3d, heatmap and csv for samples
  horizontalheatmapFileName <- "output/HorizontalSampleHeatmap.svg"
  svg(horizontalheatmapFileName)
  image(x = seq(sampleSize), y = tParArray,
        z = t(horizontal2dSample), xlab = "observation index", ylab = "tPar")
  title("Heatmap of horizontal sample")
  dev.off()

  horizontal3dFileName <- "output/HorizontalSample3d.svg"
  svg(horizontal3dFileName)
  print(wireframe(t(horizontal2dSample), xlab = "observation index",
                  ylab = "tPar", zlab = "value", drape = T))
  dev.off()

  csvFileNameHorizontal <- "output/csvHorizontalSample"
  csvExport(infoArray = horizontal2dSample, fileNameCSV = csvFileNameHorizontal,
            rowNames = T)

  csvFileNameDiagonal <- "output/csvDiagonalSample"
  csvExport(infoArray = diagonalSample, fileNameCSV = csvFileNameDiagonal,
            rowNames = T)
}
