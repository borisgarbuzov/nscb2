#' @title createOriginalCauchyDist
#'
#' @name createOriginalCauchyDist
#'
#' @aliases createOriginalCauchyDist
#'
#' @description Create \code{b}, a.k.a. bandwidth given \code{n} as being a sample size
#'
#' @param n the sample size
#'
#' @return A scalar value of \code{b}.
#'
#' @examples bandwidthValue <- computeB(n = 8)
#'
#' @export

createOriginalCauchyDist <- function(size,
                                     psi,
                                     mean)
{

  centeredMA1Array = stats::arima.sim(n = size,
                                     rand.gen = rcauchy,
                                     model = list(ma = c(psi)))
  shiftedMA1Array = centeredMA1Array + mean
  return (shiftedMA1Array)
}
