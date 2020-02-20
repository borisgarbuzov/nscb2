#' @title createOriginalMA1
#'
#' @name createOriginalMA1
#'
#' @aliases createOriginal
#'
#' @description Creating a one-dimensional array using \code{stats::arima.sim()}, passing \code{size}, \code{sigma} and \code{psi} (\code{psi} being the argument of the model).
#'
#' @param size The size of the future one-dimensional array.
#' @param psi The main argument passed to the model of \code{stats::arima.sim()}.
#' @param sigma \code{sigma} parameter as being the regular sigma, a.k.a. std.
#' @param mean \code{mean} parameter as being the regular mean.
#'
#' @return Returning a one-dimensional array of size \code{size}.
#'
#' @examples
#' createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#'
#' @export

createOriginalMA1 <- function(size,
                              psi ,
                              sigma,
                              mean) {
  centeredMA1Array = stats::arima.sim(n = size,
                   model = list(ma = c(psi)),
                   sd = sigma,
                   mean = 0)
  shiftedMA1Array = centeredMA1Array + mean
  return (shiftedMA1Array)

}


