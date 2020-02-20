horizontal3dPlot <- function(sampleSize = 10,
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

  fileName <- paste0("output/3dPlot(sampleSize=", sampleSize, "tParCount=",
                     tParCount, ").svg")

  # create graphic
  svg(fileName)
  print(wireframe(t(horizontal2dSample), xlab = "observation index",
                  ylab = "tPar", zlab = "value", drape = T))
  dev.off()
}
