testUtilComputeBForGamma <- function(sampleSize,
                                     bandWidthPowerForGamma){
  cat("\n Testing \'tests_scb2_173_computeBForGamma\ \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("bandWidthPowerForGamma =", bandWidthPowerForGamma, "\n")

  Start <- Sys.time()

  bandWidthForGamma <- computeBForGamma(sampleSize = sampleSize,
                                        bandWidthPowerForGamma = bandWidthPowerForGamma)

  End <- Sys.time()
  duration <- End - Start

  cat("\n Result:\n")
  cat("Duration =", duration, "\n")

  cat("bandWidthForGamma =", bandWidthForGamma, "\n")

  cat("End of test computeBForGamma", "\n")

  cat("=====================\n")
}
