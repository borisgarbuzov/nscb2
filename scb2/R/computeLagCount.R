#' @title computeLagCount
#'
#' @name computeLagCount
#'
#' @aliases computeLagCount
#'
#' @description Create \code{b}, a.k.a. bandwidth given \code{n} as being a sample size
#'
#' @param sampleSize the sample size
#' @param lag lag
#'
#' @return A scalar value of \code{b}.
#'
#' @examples bandwidthValue <- computeB(n = 8)
#'
#' @export

computeLagCount <- function (sampleSize, lag)
{
  myTermCount = computeTermCount (sampleSize)
  return (myTermCount + lag)
}
