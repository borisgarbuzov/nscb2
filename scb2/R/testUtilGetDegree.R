testUtilGetDegree <- function(degree){

  cat("\nTesting \'tests_scb2_168_getDegree\ \n")
  cat("\nTest parameters :")
  cat("\nbDegree =", degree, "\n")

  Start <- Sys.time()

  degree <- getDegree(degree = degree)

  End <- Sys.time()
  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("degree =", degree, "\n")
  cat("End of test getDegree", "\n")
  cat("=====================\n")
}
