testUtilComputeB <- function(sampleSize){

  cat("\n Testing \'tests_scb2_167_computeB\ \n")
  cat("\nTest parameters :")
  cat("\nsampleSize =", sampleSize, "\n")

  Start <- Sys.time()

  b <- computeB(sampleSize = sampleSize)

  End <- Sys.time()
  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("b =", b, "\n")
  cat("End of test computeB", "\n")
  cat("=====================\n")
}
