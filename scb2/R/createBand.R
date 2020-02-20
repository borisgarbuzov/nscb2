#' @title createBand

#' @name createBand
#'
#' @aliases createConfidenceBand
#'
#' @description Create a confidence intervals band.
#'
#' @param tParArray tParArray
#' @param lag lag
#' @param lagCount lagCount
#' @param sampleSize sampleSize
#' @param nonCoverageProbability nonCoverageProbability
#'
#' @return A two dimensional vector representing the lower and the upper bound of CI.
#'
#' @examples
#'
#' @export

createBand <- function(tParArray,
                       lag,
                       lagCount,
                       sampleSize,
                       nonCoverageProbability)
{
  # get the real correlation computeCor
  # call ME (sample, bandwidth, nonCoverageProbability)
  # upper = corArray + ME
  # upper = corArray + ME

  mySample=createSample(sampleSize = sampleSize)
  mySampleSize=length(mySample)
  bandwidth = computeB(sampleSize = mySampleSize)
  mockallCorHat = computeAllCorHats(
    tParArray = tParArray,
    lagCount = lagCount,
    sample = mySample
  )

  meByCovHat <- computeMEbyCovHat(
    tParArray = tParArray,
    lag = lag,
    lagCount = lagCount,
    sample = mySample,
    bandwidth = bandwidth,
    nonCoverageProbability = nonCoverageProbability,
    allCorHats = mockallCorHat,
    C_K = -1.978325,
    PHI_K_NORMAL_DIFF = 0.4065)

  corHat = computeCorHat(
    tParArray = tParArray,
    lag = lag,
    sample = mySample

  )


  lowerBound <- corHat - meByCovHat
  upperBound <- corHat + meByCovHat
  band <- cbind(lowerBound, upperBound)
  # saveBand(corArray = corArray,band =band,fileName = myfileName )
  return(band)



}
