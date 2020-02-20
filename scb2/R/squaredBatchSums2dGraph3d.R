squaredBatchSums2dGraph3d <- function(samples, tParArray, sampleSize, bounds){
  # check if output directory exists
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  diagonal2dSquaredBatchSums <- samples[[2]]
  horizontal2dSquaredBatchSums <- samples[[1]]

  fileNameDiagonal <- paste0("output/SquaredBatchSumsForDiagonal3d(sampleSize=",
                             sampleSize, "tParCount=",
                             length(tParArray[bounds]), ").svg")

  # create graphic
  svg(fileNameDiagonal)
  print(wireframe(t(diagonal2dSquaredBatchSums), xlab = "tPar",
                  ylab = "observation index",
                  zlab = list("squared batch sum value", rot = 90), drape = T))
  dev.off()

  fileNameHorizontal <- paste0("output/SquaredBatchSumsForHorizontal3d(sampleSize=",
                               sampleSize, "tParCount=",
                               length(tParArray[bounds]), ").svg")

  # create graphic
  svg(fileNameHorizontal)
  print(wireframe(t(horizontal2dSquaredBatchSums), xlab = "tPar",
                  ylab = "observation index",
                  zlab = list("squared batch sum value", rot = 90), drape = T))
  dev.off()
}
