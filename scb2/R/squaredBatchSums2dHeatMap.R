squaredBatchSums2dHeatMap <- function(samples, tParArray, sampleSize, bounds){
  # check if output directory exists
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  diagonal2dSquaredBatchSums <- samples[[2]]
  horizontal2dSquaredBatchSums <- samples[[1]]

  fileNameDiagonal <- paste0("output/heatmapForDiagonalSquaredBatchSums2d(sampleSize=",
                             sampleSize, "tParCount=",
                             length(tParArray[bounds]), ").svg")
  svg(fileNameDiagonal)
  image(x = tParArray[bounds], y = seq(sampleSize),
        z = t(diagonal2dSquaredBatchSums),
        xlab = "tPar", ylab = "observation index")
  title("Heatmap of diagonal 2d squared batch sums")

  dev.off()

  fileNameHorizontal <- paste0("output/heatmapForHorizontalSquaredBatchSums2d(sampleSize=",
                               sampleSize, "tParCount=",
                               length(tParArray[bounds]), ").svg")
  svg(fileNameHorizontal)
  image(x = tParArray[bounds], y = seq(sampleSize),
        z = t(horizontal2dSquaredBatchSums),
        xlab = "tPar", ylab = "observation index")
  title("Heatmap of horizontal 2d squared batch sums")

  dev.off()
}
