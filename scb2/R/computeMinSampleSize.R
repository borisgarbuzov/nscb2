#' @title ComputeMinSampleSize
#'
#' @name ComputeMinSampleSize
#'
#' @aliases ComputeMinSampleSize
#'
#' @description ComputeMinSampleSize
#'
#' @param alpha alpha
#'
#' @return
#'
#' @examples
#'
#' @export
computeMinSampleSize <- function(alpha)
{
  minSampleSizeBandwidth <- computeMinSampleSizeForBandwidth()
  minSampleSizeAlpha <- computeMinSampleSizeForAlpha(alpha = alpha)
  return(max(minSampleSizeAlpha,minSampleSizeBandwidth))
}
