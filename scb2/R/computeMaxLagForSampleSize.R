#' @title computeMaxLagForSampleSize
#'
#' @name computeMaxLagForSampleSize
#'
#' @aliases computeMaxLagForSampleSize
#'
#' @description Create \code{b}, a.k.a. bandwidth given \code{n} as being a sample size
#'
#' @param sampleSize the sample size
#'
#' @return A scalar value of \code{b}.
#'
#' @examples bandwidthValue <- computeB(n = 8)
#'
#' @export

computeMaxLagForSampleSize <- function (sampleSize)
{

  maxLag = sampleSize - computeTermCount(sampleSize) - 1
  return (maxLag)
}
