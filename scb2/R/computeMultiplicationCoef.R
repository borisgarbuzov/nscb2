computeMultiplicationCoef <- function(sampleSize)
{
  bCov <- computeBCov5(sampleSize = sampleSize)
  multCoef <- sqrt(-2 * log(bCov)) * sqrt((sampleSize * bCov) / getPHI_K(type = "normal"))
  return(multCoef)
}
