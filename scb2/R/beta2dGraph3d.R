beta2dGraph3d <- function(samples, tParArray, sampleSize, bounds){
  # check if output directory exists
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  diagonal2dBeta <- na.omit(samples[[2]])
  horizontal2dBeta <- na.omit(samples[[1]])

  fileNameDiagonal <- paste0("output/betaForDiagonal3d(sampleSize=",
                             sampleSize, "tParCount=",
                             length(tParArray[bounds]), ").svg")

  # create graphic
  svg(fileNameDiagonal)
  print(wireframe(t(diagonal2dBeta), xlab = "tPar",
                  ylab = "observation index", zlab = "beta value", drape = T))
  dev.off()

  fileNameHorizontal <- paste0("output/betaForHorizontal3d(sampleSize=",
                             sampleSize, "tParCount=",
                             length(tParArray[bounds]), ").svg")

  # create graphic
  svg(fileNameHorizontal)
  print(wireframe(t(horizontal2dBeta), xlab = "tPar",
                  ylab = "observation index", zlab = "beta value", drape = T))
  dev.off()
}
