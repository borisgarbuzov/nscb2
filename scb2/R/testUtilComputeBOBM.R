testUtilComputeBOBM <- function(sampleSize,
                                bandWidthDegree){
  cat("\n Testing \'tests_scb2_174_computeBOBM\ \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("bandWidthDegree =", bandWidthDegree, "\n")

  Start <- Sys.time()

  bandWidth <- computeBOBM(sampleSize = sampleSize,
                           bandWidthDegree = bandWidthDegree)

  End <- Sys.time()
  duration <- End - Start

  cat("\nResult:\n")
  cat("Duration =", duration, "\n")

  cat("bandWidth =", bandWidth, "\n")

  cat("End of test computeBOBM", "\n")

  cat("=====================\n")
}
