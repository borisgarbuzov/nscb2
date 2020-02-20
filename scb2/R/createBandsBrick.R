#' @title createBandsArray

#' @name createBandsArray
#'
#' @aliases createBands
#'
#' @description Create a three-dimensional array of confidence intervals bands of size c(replicationCount, sampleSize, 2).
#'
#' @param tParArray tParArray
#' @param lag lag
#' @param lagCount lagCount
#' @param bandwidth bandwidth
#' @param sampleSize sampleSize
#' @param nonCoverageProbability nonCoverageProbability = 0.05
#' @param replicationCount replicationCount

#' @return A two dimensional vector representing the lower and the upper bound of CI.
#'
#' @examples
#'
#' @export

createBandsBrick <- function(tParArray,
                             lag,
                             lagCount,
                             bandwidth,
                             sampleSize,
                             nonCoverageProbability = 0.05,
                             replicationCount)
{
  # generate replicationCount of samples
  # for each sample, create a band
  # pack those bands together into a brick
  # return that brick
  tParCount=length(tParArray)
  bandsArray <- array(0, dim = c(replicationCount,tParCount, 2))

  for (repCountIndex in 1:replicationCount)
  {

    bandsArray[repCountIndex, ,] <-
      createBand(
        tParArray = tParArray,
        lag = lag,
        lagCount = lagCount,
        sampleSize = sampleSize,
        nonCoverageProbability = nonCoverageProbability
      )

  }

  bandsArray
}
