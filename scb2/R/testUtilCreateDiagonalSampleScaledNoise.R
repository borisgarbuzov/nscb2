testUtilCreateDiagonalSampleScaledNoise <- function(sampleSize,
                                                    mean,
                                                    sigma,
                                                    noise) {

  cat("\n Testing \'tests_scb2_200_createDiagonalSampleScaledNoise\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("mean =", mean, "\n")
  cat("sigma =", sigma, "\n")
  cat("noise =", noise, "\n")

  Start <- Sys.time()

  diagonalSample <- createDiagonalSampleScaledNoise(sampleSize = sampleSize,
                                                    mean = mean,
                                                    sigma = sigma,
                                                    noise = noise)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", diagonalSample, "\n")

  cat("End of test createDiagonalSampleScaledNoise", "\n")
  cat("=====================\n")
}
