testUtilBetaColumnGraphSingleN <- function(tParCount,
                                           sampleSize,
                                           bConst){
  cat("\n Testing \'tests_scb2_195_betaColumnGraphSingleN\' \n")

  cat("\nTest parameters:", "\n")
  cat("tParCount =", tParCount, "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("bConst =", bConst, "\n")

  Start <- Sys.time()

  graph <- betaColumnGraphSingleN(tParCount = tParCount,
                                  sampleSize = sampleSize,
                                  bConst = bConst)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test betaColumnGraphSingleN", "\n")
  cat("=====================\n")
}
