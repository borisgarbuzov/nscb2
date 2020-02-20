testUtilGenerateZhouStatisticArray <- function(sampleSize,
                                               tParCount,
                                               replicationCount,
                                               parList,
                                               isPlot) {

  cat("\n Testing \'tests_scb2_224_generateZhouStatisticArray\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("replicationCount =", replicationCount, "\n")
  cat("parList =", parList, "\n")
  cat("isPlot =", isPlot, "\n")

  Start <- Sys.time()

  zhouStatisticArray <-
    generateZhouStatisticArray(
      sampleSize = sampleSize,
      tParCount = tParCount,
      replicationCount = replicationCount,
      parList = parList,
      isPlot = isPlot
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test generateZhouStatisticArray", "\n")
  cat("=====================\n")


}
