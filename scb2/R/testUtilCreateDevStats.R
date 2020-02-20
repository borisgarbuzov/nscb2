#' export

testUtilCreateDevStats <- function() {
  cat("\nTesting \'tests_99_createDevStats\' \n")
  Start <- Sys.time()
  devStats <- createDevStats()
  End <- Sys.time()
  duration <- End - Start
  cat("Result:\n")
  cat("devStats$fileStats = \n")
  print(devStats[[1]][1:3, ])
  cat("devStats$categoryStats = \n")
  print(devStats[[2]][1:3, ])
  cat("devStats$generalStats = \n")
  print(devStats[[3]])
  cat("End of test createDevStats", "\n")
  cat("=====================\n")
}
