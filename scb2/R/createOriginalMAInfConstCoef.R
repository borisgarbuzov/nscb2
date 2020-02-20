#' @title createOriginalMAInfConstCoef
#'
#' @name createOriginalMAInfConstCoef
#'
#' @aliases createOriginalMAInfConstCoef
#'
#' @description Creating a one-dimensional array using \code{stats::arima.sim()}, passing \code{size}, \code{sigma} and vector of \code{psi}.
#'
#' @param size The size of the future one-dimensional array.
#' @param psi The main argument passed to the model of \code{stats::arima.sim()}.
#' @param maxSize \code{maxSize} parameter as being the max size of \code{psi} vector.
#' @param sigma \code{sigma} parameter as being the regular sigma, a.k.a. std.
#' @param mean \code{mean} parameter as being the regular mean.
#'
#' @return Returning a one-dimensional array of size \code{size}.
#'
#' @examples
#' createOriginalMAInfConstCoef(size = 10, psi = 0.5, sigma = 1, maxSize = 100)
#'
#' @export

# we may give maxSize
# or the whole vector of coefficients of length maxSize
# the recursion depth should be greater or equal to the sample size
# if we give maxSize and combHeight = psi
# we can create the name not maxSize,
# but recursionDepth comb is a rectangle
# its height is psi and its width is maxSize or recursionDepth
# we can give the dimensions in the arguments
# or the comb itself

createOriginalMAInfConstCoef <- function(size,
                                         sigma,
                                         mean,
                                         psi,
                                         psiMaxSize,
                                         psiIncrement = FALSE) {
  psiVector <- rep(psi, psiMaxSize)
  originalMAInfConstCoef <- stats::arima.sim(n = size,
                                             model = list(ma = psiVector),
                                             sd = sigma,
                                             mean = mean)
  # shiftedoriginalArray <- originalArray + mean
  if (psiIncrement == TRUE) {
    originalMAInfConstCoef <- array(NA, dim = c(size, psiMaxSize))

    for (psiCount in 1:psiMaxSize) {
      psiVector <- rep(psi, psiCount)
      originalMAInfConstCoef [ , psiCount] <-
        as.vector(stats::arima.sim(n = size,
                                   model = list(ma = psiVector),
                                   sd = sigma,
                                   mean = mean)
                  )
      }
  }

  originalMAInfConstCoef

}


