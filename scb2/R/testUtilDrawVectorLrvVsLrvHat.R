testUtilDrawVectorLrvVsLrvHat <- function(size,
                                          psi,
                                          sigma,
                                          mean,
                                          lrvHatCount)
{
  cat("\nTesting \'tests_64_drawVectorLrvVsLrvHat\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

  Start = Sys.time()

  drawVectorLrvVsLrvHat(
    size = size,
    psi = psi,
    sigma = sigma,
    mean = mean,
    lrvHatCount = lrvHatCount,
    isProductCol = TRUE
  )

  End = Sys.time()
  DurationProduct = End - Start
  Start = Sys.time()

  drawVectorLrvVsLrvHat(
    size = size,
    psi = psi,
    sigma = sigma,
    mean = mean,
    lrvHatCount = lrvHatCount,
    isProductCol = FALSE
  )

  End = Sys.time()
  DurationBeta = End - Start

  cat("Duration Product =", DurationProduct, "\n")
  cat("Duration Beta =", DurationBeta, "\n")


  cat("End of test drawVectorLrvVsLrvHat", "\n")

  cat("=====================\n")
}
