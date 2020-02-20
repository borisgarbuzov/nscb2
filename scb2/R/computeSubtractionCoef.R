computeSubtractionCoef <- function(sampleSize)
{
  bCov <- computeBCov5(sampleSize = sampleSize)
  subtractCoef <- (-2 * log(bCov)) + getC_K(type = "normal")
  return(subtractCoef)
}
