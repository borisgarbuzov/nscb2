testUtilComputeBeta2d <- function(tParCount,
                                  sampleSize,
                                  bConst){
  cat("\n Testing \'tests_scb2_197_computeBeta2d\' \n")

  cat("\nTest parameters:", "\n")
  cat("tParCount =", tParCount, "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("bConst =", bConst, "\n")

  Start <- Sys.time()

  beta2d <- computeBeta2d(tParCount = tParCount,
                          sampleSize = sampleSize,
                          bConst = bConst)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test computeBeta2d", "\n")
  cat("=====================\n")
}
