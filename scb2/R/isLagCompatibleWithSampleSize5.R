isLagCompatibleWithSampleSize5 <- function(sampleSize,
                                           lag) {
  isCompatible <- 0 < lag & lag < (sampleSize - 1)

  return(isCompatible)
}
