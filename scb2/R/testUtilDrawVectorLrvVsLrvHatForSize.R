testUtilDrawVectorLrvVsLrvHatForSize <- function(sizeArray,
                                          psi,
                                          sigma,
                                          mean)
{
  cat("\nTesting \'tests_65_drawVectorLrvVsLrvHatForSize\' \n")

  cat("Test parameters:", "\n")
  cat("size =", sizeArray, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

  Start=Sys.time()

  drawVectorLrvVsLrvHatForSize(size = sizeArray,
                               psi = psi,
                             sigma = sigma,
                                mean = mean,
                        isProductCol = TRUE)

  End=Sys.time()
  DurationProduct=End-Start
  Start=Sys.time()

  drawVectorLrvVsLrvHatForSize(size = sizeArray,
                        psi = psi,
                        sigma = sigma,
                        mean = mean,
                        isProductCol = FALSE)

  End=Sys.time()
  DurationBeta=End-Start

  cat("Duration Product =",DurationProduct,"\n")
  cat("Duration Beta =",DurationBeta,"\n")


  cat("End of test drawVectorLrvVsLrvHatForSize","\n")

  cat("=====================\n")
}
