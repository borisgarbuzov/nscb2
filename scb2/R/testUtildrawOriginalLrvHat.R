testUtildrawOriginalLrvHat <- function(sizeArray,
                                       sigma,
                                       psi,
                                       mean) {
  cat("\nTesting \'tests_63_drawOriginalLrvHat\' \n")

  cat("Test parameters:", "\n")
  cat("sizeArray =", sizeArray, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

  Start = Sys.time()
  drawOriginalLrvHat(sizeArray = sizeArray,
                     psi = psi,
                     sigma = sigma,
                     mean = mean)
  End=Sys.time()
  Duration=End-Start
  cat("Duration =",Duration,"\n")

  cat("End of test drawOriginalLrvHat","\n")

  cat("=====================\n")
}
