computeBForGamma <- function(sampleSize, bandWidthPowerForGamma){
  bandWidthForGamma <- sampleSize^(-bandWidthPowerForGamma)
  return(bandWidthForGamma)
}
