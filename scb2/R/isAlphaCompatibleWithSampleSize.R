#' @title isAlphaCompatibleWithSampleSize
#'
#' @name isAlphaCompatibleWithSampleSize
#'
#' @aliases isAlphaCompatibleWithSampleSize
#'
#' @description isAlphaCompatibleWithSampleSize
#'
#' @param sampleSize
#' @param alpha
#'
#' @return
#'
#' @examples
#'
#'@export

isAlphaCompatibleWithSampleSize <- function (sampleSize, alpha)
{
  minSampleSize = computeMinSampleSizeForAlpha (alpha)
  isCompatible = sampleSize >= minSampleSize
  return (isCompatible)
}
