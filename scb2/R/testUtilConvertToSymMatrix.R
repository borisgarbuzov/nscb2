testUtilConvertToSymMatrix <- function(originalMatrix) {
  cat("\nTesting \'tests_79_convertToSymMatrix\' \n")

  cat("Test parameters:", "\n")
  cat("originalMatrix :"); print(originalMatrix); cat("\n")

  Start <- Sys.time()
  recoveredMatrix <- convertToSymMatrix(originalMatrix = originalMatrix)
  End <- Sys.time()
  symMatrix = 1/2 *(originalMatrix + t(originalMatrix))
  duration <- End - Start

  cat("Result:\n")
  cat("recoveredMatrix = \n")
  print(recoveredMatrix)
  cat("\nCompare recovered vs Symmetric matrix:");print(testthat::compare(recoveredMatrix,symMatrix));cat("\n")
  cat("Duration =", duration, "\n")
  cat("End of test convertToSymMatrix","\n")

  cat("=====================\n")
}
