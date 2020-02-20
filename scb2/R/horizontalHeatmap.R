horizontalHeatmap <- function(sampleSize = 10,
                              tParCount = 11,
                              mean = 0,
                              sigma = 2){
  # check if output directory exists
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # create horizontal sample
  samples <- createDiagHorSamplesScaledNoise(sampleSize = sampleSize,
                                            tParCount = tParCount, mean = mean,
                                            sigma = sigma)
  horizontal2dSample <- samples[[1]]

  # create tParArray to show values on heatmap
  tParArray <- createTParArray(tParCount = tParCount)

  fileName <- paste0("output/heatmap(sampleSize=", sampleSize, "tParCount=",
                     tParCount, ").svg")

  # create graphic
  svg(fileName)
  image(x = seq(sampleSize), y = tParArray, z = t(horizontal2dSample),
        xlab = "observation index", ylab = "tPar")
  title("Heatmap of horizontal sample")
  dev.off()
}
