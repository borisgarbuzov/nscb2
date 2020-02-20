scenario3BatchSums <- function(tParCount = 100,
                             sampleSize = 1000,
                             sigma = 2,
                             pictureWidth = 2000,
                             pictureHeight = 1000,
                             isSeed = "random",
                             typeOfKernel = "gaussian",
                             noise = NULL,
                             bDegree = -0.26)
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
  bandWidth <- computeB(sampleSize, bDegree)
  batchSize <- computeBatchSize(sampleSize)

  "Take the degrees by which b and m were calculated, and then display it on the graph"
  bandWidthDegree <- getDegree(bDegree)
  batchSizeDegree <- getDegreeForBatchSize()

  "Take the constants by which b and m"
  bConst <- getScaleConstant()
  mConst <- getBatchSizeScaleConstant()

  "Create an array of parameters t"
  tParArray <- createTParArray(tParCount)

  "Define the boundaries of the sandbox"
  newTParArrayIndex <- createNewTParArrayIndex(tParArray = tParArray,
                                               bandWidth = bandWidth)

  "Create a diagonal and horizontal selection"
  samples <- createDiagHorSamples(sampleSize, tParCount, mean = 0, sigma = sigma, noise)
  diagonalSample <- samples[[2]]
  horizontal2dSample <- samples[[1]]

  "Count the squares of the block sums"
  diagonalSquaredBatchSumArray <- sampleSplit(sample = diagonalSample,
                                             batchSize = batchSize)


  for(i in newTParArrayIndex[1]:newTParArrayIndex[2]){
    horizontalSquaredBatchSumArray <- sampleSplit(sample = horizontal2dSample[i,],
                                                  batchSize = batchSize)

    nameOfFile <- paste0("output/BatchSums_t=", tParArray[i], ".svg")


    "Create an output graph of the estimated and
    true LRV dependence on the parameter t"
    arraySize <- length(diagonalSquaredBatchSumArray)
    color1Array <- array(data = "blue", dim = arraySize)
    color2Array <- array(data = "red", dim = arraySize)
    color3Array <- array(data = "black", dim = arraySize)


    svg(nameOfFile)
    plot(x = c(1:length(diagonalSquaredBatchSumArray), 1:length(diagonalSquaredBatchSumArray)),
         y = c(diagonalSquaredBatchSumArray, horizontalSquaredBatchSumArray),
         col = c(color1Array, color2Array), xlab = "Batch Sum Index",
         ylab = "squared Batch Sum Value",
         xlim = c(0, length(diagonalSquaredBatchSumArray)),
         ylim = c(0, max(c(diagonalSquaredBatchSumArray, horizontalSquaredBatchSumArray))),
         main = "Graph for squared batch sums", pch = 21, bg = c(color1Array, color2Array))

      lines(1:length(diagonalSquaredBatchSumArray), diagonalSquaredBatchSumArray, col = "blue")
      lines(1:length(horizontalSquaredBatchSumArray), horizontalSquaredBatchSumArray, col = "red")

    legend("bottomright",
           legend = c("diagonal", "horizontal"),
           col = c("blue", "red"), lty=1:1, cex = 0.8)

    sampleSizeLegend <- paste("Sample size =", sampleSize)
    pointCountLegend <- paste("number of points =", arraySize)
    lastBandWidthLegend <- paste("b =", round(bandWidth, 4))
    lastbatchSizeLegend <- paste("m =", batchSize)
    bandWidthLegend <- paste("b = B * n^", bandWidthDegree)
    batchSizeLegend <- paste("m = M * n^", batchSizeDegree)
    bConstLeg = paste("B =", bConst)
    mConstLeg = paste("M =", mConst)

    endTime <- Sys.time()
    durationHours <- as.integer(floor(difftime(endTime, startTime, units="hours")))
    durationMins <- as.integer(floor(difftime(endTime, startTime, units="mins"))) %% 60
    durationSecs <- as.integer(floor(difftime(endTime, startTime, units="secs"))) %% 60

    durationLegend <- paste0("duration = ", durationHours, ":",
                             durationMins, ":", durationSecs)

    legend("topleft",
           legend = c(sampleSizeLegend, pointCountLegend,
                      bandWidthLegend, batchSizeLegend,
                      bConstLeg, mConstLeg,
                      lastBandWidthLegend, lastbatchSizeLegend,
                      durationLegend),
           cex = 0.8)

    dev.off()
  }

}

