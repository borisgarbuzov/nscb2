#'@export
testUtilSaveJPG <- function(filename,path)
{

  cat("\nTesting \'tests_72_SaveJPG\' \n")
  cat("Test parameters:", "\n")
  cat("path =", path, "\n")
  cat("fileName =", filename, "\n")

  start=Sys.time()
  saveJpg(fileName = filename,path = path)
  graphics.off()
  end=Sys.time()
  Duration=end-start
  cat("Duration =",Duration,"\n")

  cat("End of test saveJPG","\n")
}
