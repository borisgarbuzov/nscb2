testUtilManualDiagonalSample <- function(sampleSize,
                                         tParCount,
                                         noise,
                                         expectedDiagonalSample){
  cat("\n Testing \'manualDiagonalSample\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("noise =", noise, "\n")

  samples <- createDiagHorSamplesScaledNoise(sampleSize = sampleSize,
                                             tParCount = tParCount,
                                             sigma = 2,
                                             noise = noise)
  diagonalSample = samples[[2]]
  # isEqualArray <- (expectedDiagonalSample == diagonalSample)

  cat("Result:\n")

  #View(isEqualArray)
  #View(expectedDiagonalSample)
  #View(diagonalSample)

  # cat("isEqualArray:", isEqualArray, "\n")
  cat("expectedDiagonalSample:", expectedDiagonalSample, "\n")
  cat("diagonalSample:", diagonalSample, "\n")

  # expect_equivalent(object = diagonalSample,
  #                   expected = expectedDiagonalSample)


  cat("End of test manualDiagonalSample", "\n")

  cat("=====================\n")
}
