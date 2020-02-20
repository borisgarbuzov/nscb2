testUtilDrawMatrix <- function() {
  size = 50
  batchSize = 5
  cat("\nTesting \'tests_100_drawMatrix\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("batchSze", batchSize,"\n")
  cat("=====================\n")
  matrix <- computeQuadraticFormMatrixFromNB(size = size,
                                             batchSize = batchSize)
  drawMatrix(matrix)

  cat("End of test drawMatrix \n")
  }
