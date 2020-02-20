beta2dHeatMap <- function(samples, tParArray, sampleSize, bounds){
  # check if output directory exists
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  diagonal2dBeta <- na.omit(samples[[2]])
  horizontal2dBeta <- na.omit(samples[[1]])


  fileNameDiagonal <- paste0("output/heatmapForDiagonalBeta2d(sampleSize=",
                             sampleSize, "tParCount=",
                             length(tParArray[bounds]), ").svg")
  svg(fileNameDiagonal)
  image(x = tParArray[bounds], y = seq(sampleSize - 2), z = t(diagonal2dBeta),
        xlab = "tPar", ylab = "observation index")
  title("Heatmap of diagonal 2d beta")

  dev.off()

  fileNameHorizontal <- paste0("output/heatmapForHorizontalBeta2d(sampleSize=",
                             sampleSize, "tParCount=",
                             length(tParArray[bounds]), ").svg")
  svg(fileNameHorizontal)
  image(x = tParArray[bounds], y = seq(sampleSize - 2), z = t(horizontal2dBeta),
        xlab = "tPar", ylab = "observation index")
  title("Heatmap of horizontal 2d beta")

  dev.off()
}
