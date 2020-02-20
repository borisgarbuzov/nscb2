squaredBatchSumsColumnGraph <- function(tParCount = 11,
                                        tIndex = 6,
                                        sampleSize = 100,
                                        sigma = 2,
                                        lag = 2,
                                        pictureWidth = 2000,
                                        pictureHeight = 1000,
                                        mySeed = "random",
                                        renevalOrExpansion = "renewal",
                                        typeOfKernel = "gaussian",
                                        bDegree = 1/13,
                                        bConst = 0.1,
                                        mConst = 1,
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

  "Fix the beginning of calculations to show
  on the chart how much time it took for the program to work"
  startTime <- Sys.time()

  tParArray <- createTParArray(tParCount)

  if(renevalOrExpansion == "expansion"){
    diagHorizSamplePair <- createDiagHorSamples(sampleSize,
                                                tParCount, mean = 0, sigma = sigma, noise = NULL,
                                                type = "ScaledNoise")
  }

  bandWidth <- computeBOBM(sampleSize, bDegree, bConst = bConst)
  bandWidthDegree <- bDegree
  batchSize <- computeBatchSize(sampleSize, mConst)
  batchSizeDegree <- getDegreeForBatchSize()


  if((tParArray[tIndex] < bandWidth) | (tParArray[tIndex] > 1-bandWidth)){
    cat("Error: The selected t is outside the 'sandbox'. ")
    return(NULL)
  }

  if(renevalOrExpansion == "renewal"){
    diagHorizSamplePair <- createDiagHorSamples(sampleSize, tParCount,
                                                mean = 0, sigma = sigma, noise = NULL,
                                                type = "ScaledNoise")
    diagonalSample <- diagHorizSamplePair[[2]]
    horizontal2dSample <- diagHorizSamplePair[[1]]
  }

  if(renevalOrExpansion == "expansion"){
    diagonalSample <- diagHorizSamplePair[[2]]
    horizontal2dSample <- diagHorizSamplePair[[1]]
    diagonalSample <- diagonalSample[1:sampleSize]
    horizontal2dSample <- horizontal2dSample[,1:sampleSize]
  }

  diagonalBetaColumn <- computeBetaMatrixColumnHat(diagonalSample,
                                                   lag = lag,
                                                   tPar = tParArray[tIndex],
                                                   bDegreeForGamma,
                                                   batchSize)

  diagonalSquaredBatchSumArray <- sampleSplit(sample = diagonalBetaColumn,
                                              batchSize = batchSize)


  "Create diagonal Beta Matrix"
  horizontalBetaColumn <- computeBetaMatrixColumnHat(horizontal2dSample[tIndex,],
                                                     lag = lag,
                                                     tPar = tParArray[tIndex],
                                                     bDegreeForGamma,
                                                     batchSize)

  horizontalSquaredBatchSumArray <- sampleSplit(sample = horizontalBetaColumn,
                                                batchSize = batchSize)

  tPar = tParArray[tIndex]

  nameOfFile <- paste0("output/SquaredBatchSumsGraph", typeOfKernel,
                       ", sampleSize=", sampleSize, ".svg")

  arraySize <- length(diagonalSquaredBatchSumArray)
  color1Array <- array(data = "blue", dim = arraySize)
  color2Array <- array(data = "red", dim = arraySize)

  ymax <- max(max(diagonalSquaredBatchSumArray),
              max(horizontalSquaredBatchSumArray))
  ymin <- min(min(diagonalSquaredBatchSumArray),
              min(horizontalSquaredBatchSumArray))

  svg(nameOfFile)
  plot(x = c(1:length(diagonalSquaredBatchSumArray),
             1:length(horizontalSquaredBatchSumArray)),
       y = c(diagonalSquaredBatchSumArray, horizontalSquaredBatchSumArray),
       col = c(color1Array, color2Array), xlab = "index",
       ylab = "squared batch sums value",
       xlim = c(0, length(diagonalSquaredBatchSumArray)),
       ylim = c(ymin, ymax),
       main = "Graph for squared batch sums columns", pch = 21,
       bg = c(color1Array, color2Array))
  legend("topright", legend = c("diagonal", "horizontal"),
         col = c("blue", "red"), lty=1:1, cex = 0.8)

  tLegend <- paste("t =", tPar)
  lagLegend <- paste("lag =", lag)
  pointCountLegend <- paste("number of points =", arraySize)
  bDegreeBandWidthLegend <- paste("bDegree =", round(bDegree, 4))
  bandWidthLegend <- paste("b= n^", round(bandWidth, 4))
  bDegreeForGammaLegend <- paste("bDegree for gamma =", round(bandWidth, 4))
  bandWidthForGammaLegend <- paste("b for gamma = n^",
                                   round(computeBForGamma(sampleSize, bDegreeForGamma), 4))
  bConstLegend <- paste("B = ", round(bConst, 4))
  bConst = paste("B =", bConst)
  maxSampleSizeLegend <- paste("Sample size =", sampleSize)
  if(mySeed != "random"){
    seed <- "seed is const"
  }else{
    seed <- "seed is random"
  }

  endTime <- Sys.time()
  durationHours <- as.integer(floor(difftime(endTime, startTime, units="hours")))
  durationMins <- as.integer(floor(difftime(endTime, startTime, units="mins"))) %% 60
  durationSecs <- as.integer(floor(difftime(endTime, startTime, units="secs"))) %% 60

  durationLegend <- paste0("duration = ", durationHours, ":",
                           durationMins, ":", durationSecs)

  lines(1:length(diagonalSquaredBatchSumArray), diagonalSquaredBatchSumArray,
        col = "blue")
  lines(1:length(horizontalSquaredBatchSumArray), horizontalSquaredBatchSumArray,
        col = "red")


  legend("topleft", legend = c(tLegend, lagLegend, pointCountLegend,
                               bDegreeBandWidthLegend, bandWidthLegend,
                               bDegreeForGammaLegend, bandWidthForGammaLegend,
                               bConstLegend,
                               maxSampleSizeLegend,
                               durationLegend,
                               seed),
         cex = 0.8)

  dev.off()
}
