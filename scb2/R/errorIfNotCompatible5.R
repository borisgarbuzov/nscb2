errorIfNotCompatible5 <- function(sampleSize,
                                  bandWidth,
                                  lag) {
  isBandWidthCompatible <-
    isBandWidthCompatibleWithSampleSize5(bandWidth = bandWidth)
  isLagCompatible <-
    isLagCompatibleWithSampleSize5(sampleSize = sampleSize,
                                   lag = lag)

  errorMessage <- ""

  if (!isBandWidthCompatible) {
    errorMessage <- paste(errorMessage,
                          "bandWidth is not compatible with sampleSize")
  }
  if (!isLagCompatible) {
    errorMessage <- paste(errorMessage, "lag is not compatible with sampleSize")
  }

  if (!isBandWidthCompatible || !isLagCompatible) {
    stop(errorMessage)
  }
}
