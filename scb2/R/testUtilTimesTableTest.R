testUtilTimesTableTest <- function(sampleSize,
                                   tParCount,
                                   noise,
                                   expectedHorizontalSample){
  cat("\n Testing \'timesTableTest\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("noise =", noise, "\n")

  samples <- createDiagHorSamplesScaledNoise(sampleSize = sampleSize,
                                             tParCount = tParCount,
                                             sigma = 2,
                                             noise = noise)
  horizontal2dSample = samples[[1]]
  # isEqualArray <- (expectedHorizontalSample == horizontal2dSample)

  cat("Result:\n")

  #View(isEqualArray)
  #View(expectedHorizontalSample)
  #View(horizontal2dSample)

  # cat("isEqualArray:", isEqualArray, "\n")
  cat("expectedHorizontalSample:", expectedHorizontalSample, "\n")
  cat("horizontal2dSample:", horizontal2dSample, "\n")

  # expect_equivalent(object = horizontal2dSample,
  #                   expected = expectedHorizontalSample)

  cat("End of test timesTableTest", "\n")

  cat("=====================\n")
}
