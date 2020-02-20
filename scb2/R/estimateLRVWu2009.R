#' @title estimateLRVWu2009
#
#' @name estimateLRVWu2009
#'
#' @aliases estimateLRVWu2009
#'
#' @description Drawing a barplot of side-by-side values of \code{dMatrix} and \code{dHatMatrix} values. Exporting it to a JPEG file saved to \code{"./plots"} directory.
#'
#' @param dMatrix A dMatrix
#' @param dHatMatrix A dHatMatrix
#'
#' @return No data structures returned. Saving JPEG file located at \code{"./plots"} directory.
#'
#' @examples
#' dMatrix <- createDMatrix(size = 10, sigma = 1, psi = 0.5)
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' betaArray <- createBetaArray <- function(original, rho = 0.5)
#' dHatMatrix <- createDHatMatrix(betaArray, size = 10)
#' drawDvsDHat(dMatrix, dHatMatrix)
#'
#' @export

estimateLRVWu2009 <-function(sample,
                             type="nonCentered")
{
  lrv <- switch (type,
    nonCentered = estimateLRVWu2009ForNonCenteredSample(sample = sample),
    centered = estimateLRVWu2009ForCenteredSample(sample = sample)
  )
}
