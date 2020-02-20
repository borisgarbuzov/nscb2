testUtilGetDegreeForBatchSize <- function(){

  cat("\nTesting \'tests_scb2_169_getDegreeForBatchSize\ \n")
  cat("\nTest parameters :")

  Start <- Sys.time()

  degree <- getDegreeForBatchSize()

  End <- Sys.time()
  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("degree =", degree, "\n")
  cat("End of test getDegreeForBatchSize", "\n")
  cat("=====================\n")
}
