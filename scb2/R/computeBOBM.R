computeBOBM <- function (sampleSize, bandWidthDegree = -0.26, bConst = 1)
{
  b <- bConst * sampleSize ^ -bandWidthDegree
  return(b)
}
