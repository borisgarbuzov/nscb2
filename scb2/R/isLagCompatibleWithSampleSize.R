#' @title isLagCompatibleWithSampleSize
#'
#' @name isLagCompatibleWithSampleSize
#'
#' @aliases isLagCompatibleWithSampleSize
#'
#' @description isLagCompatibleWithSampleSize
#'
#' @param sampleSize
#' @param lag
#'
#' @return
#'
#' @examples
#'@export

isLagCompatibleWithSampleSize <- function (sampleSize, lag)
{
  maxLag = computeMaxLagForSampleSize(sampleSize = sampleSize)
  isCompatible = lag <= maxLag
  return (isCompatible)
}
