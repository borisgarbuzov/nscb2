#' @title isBandwidthCompatibleWithSampleSize
#'
#' @name isBandwidthCompatibleWithSampleSize
#'
#' @aliases isBandwidthCompatibleWithSampleSize
#'
#' @description isBandwidthCompatibleWithSampleSize
#'
#' @param sampleSize
#'
#' @return
#'
#' @examples
#'@export
isBandwidthCompatibleWithSampleSize <- function(sampleSize)
{
  minSampleSize <- computeMinSampleSizeForBandwidth()
  isCompatible <- sampleSize >= minSampleSize
  return(isCompatible)
}
