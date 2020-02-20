testUtilComputeAndSaveRhoAndRhoHats <- function(sampleSize,
                                                tParCount,
                                                lag,
                                                rhoHatCount,
                                                sigma,
                                                mean,
                                                noise,
                                                type,
                                                diagOrHoriz) {
  cat("\n Testing \'tests_scb2_202_computeAndSaveRhoAndRhoHats\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("lag =", lag, "\n")
  cat("rhoHatCount =", rhoHatCount, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("noise =", noise, "\n")
  cat("type =", type, "\n")
  cat("diagOrHoriz =", diagOrHoriz, "\n")

  Start <- Sys.time()

  rhoAndRhoHats <- computeAndSaveRhoAndRhoHats(sampleSize = sampleSize,
                                               tParCount = tParCount,
                                               lag = lag,
                                               rhoHatCount = rhoHatCount,
                                               sigma = sigma,
                                               mean = mean,
                                               noise = noise,
                                               type = type,
                                               diagOrHoriz = diagOrHoriz)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test computeAndSaveRhoAndRhoHats", "\n")
  cat("=====================\n")
}
