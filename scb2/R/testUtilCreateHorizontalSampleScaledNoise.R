testUtilCreateHorizontalSampleScaledNoise <- function(sampleSize,
                                                      tParCount,
                                                      mean,
                                                      sigma,
                                                      noise) {

  cat("\n Testing \'tests_scb2_201_createHorizontalSampleScaledNoise\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("mean =", mean, "\n")
  cat("sigma =", sigma, "\n")
  cat("noise =", noise, "\n")

  Start <- Sys.time()

  horizontalSample <-
    createHorizontalSampleScaledNoise(
      sampleSize = sampleSize,
      tParCount = tParCount,
      mean = mean,
      sigma = sigma,
      noise = noise
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", horizontalSample, "\n")

  cat("End of test createHorizontalSampleScaledNoise", "\n")
  cat("=====================\n")
}
