#'@export
testUtilSaveBandwith <- function()
{
  cat("\n Testing \'tests_24_saveBandwith\' \n")
  sampleSize <- 1:500

  bandwidth <- numeric(length = length(sampleSize))

  for(index in sampleSize)
  {
    bandwidth[index] <- computeB(sampleSize[index])
  }
  path <- doPath()
  fileName <- "Bandwith"
  fileName <-  timestampGenerator(fileName = fileName)

  saveJpg(fileName = "Bandwith",path = path)
  plot(bandwidth ~ sampleSize, type = "l", main = "Bandwith of samplesize")
  graphics.off()
  cat("\n End of test saveBandwithFunction", "\n")
  cat("=====================")
}
