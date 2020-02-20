testUtilComputeZhouStatistic <- function(tParCount,
                                         sample,
                                         parList,
                                         isPlot) {

  cat("\n Testing \'tests_scb2_223_computeZhouStatistic\' \n")

  cat("\nTest parameters:", "\n")
  cat("tParCount =", tParCount, "\n")
  cat("sample =", sample, "\n")
  cat("parList =", parList, "\n")
  cat("isPlot =", isPlot, "\n")

  Start <- Sys.time()

  zhouStatistic <-
    computeZhouStatistic(
      tParCount = tParCount,
      sample = sample,
      parList = parList,
      isPlot = isPlot
    )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  cat("result =", zhouStatistic, "\n")

  cat("End of test computeZhouStatistic", "\n")
  cat("=====================\n")
}
