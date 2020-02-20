testUtilDurationByTParCountComputeAndSaveBand5 <- function(
  sampleSize,
  minTParCount,
  maxTParCount,
  tParCountStep
)
{

  cat("\n Testing \'tests_scb2_236_durationByTParCountComputeAndSaveBand5\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("minTParCount =", minTParCount, "\n")
  cat("maxTParCount =", maxTParCount, "\n")
  cat("tParCountStep =", tParCountStep, "\n")

  Start <- Sys.time()

  band5 <-
    durationByTParCountComputeAndSaveBand5(
      sampleSize = sampleSize,
      minTParCount = minTParCount,
      maxTParCount = maxTParCount,
      tParCountStep = tParCountStep
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", band5, "\n")

  cat("End of test durationByTParCountComputeAndSaveBand5", "\n")
  cat("=====================\n")
}
