testUtilScenario3SingleT <- function(tParCount,
                                     tIndex,
                                     sd,
                                     minSampleSize,
                                     maxSampleSize,
                                     sampleSizeStep,
                                     bDegree,
                                     bConst = 1,
                                     mConst = 1) {

  cat("\n Testing \'tests_scb2_153_scenario3SingleT\' \n")

  cat("\nTest parameters :", "\n")
  cat("tParCount = ", tParCount, "\n")
  cat("tIndex = ", tIndex, "\n")
  cat("sd = ", sd, "\n")
  cat("bDegree = ", bDegree, "\n")

  Start <- Sys.time()

  scenario3SingleT(tParCount = tParCount,
                   tIndex = tIndex,
                   sd = sd,
                   minSampleSize = minSampleSize,
                   maxSampleSize = maxSampleSize,
                   sampleSizeStep = sampleSizeStep,
                   bDegree = bDegree,
                   bConst = bConst,
                   mConst = mConst)

  End <- Sys.time()
  duration <- End - Start

  cat("\n Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test scenario3SingleT", "\n")

  cat("=====================\n")

}
