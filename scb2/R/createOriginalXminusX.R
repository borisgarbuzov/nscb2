#' @title createOriginalXminusX
#'
#' @name createOriginalXminusX
#'
#' @aliases createOriginalXminusX
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

createOriginalXminusX <- function(size,
                                  mu,
                                  sd)
{
  firstX <- rnorm(1,mean = mu, sd=sd)
  original <- array(c(firstX,-firstX),size)
  return(original)
}
