#' @title createOriginalBernDens
#'
#' @name createOriginalBernDens
#'
#' @aliases createOriginalBernDens
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

createOriginalBernDens <- function(size,
                                   psi,
                                   mean) {

   centeredMA1Array = stats::arima.sim(n = size,
                                       rand.gen = createCenteredBernNoise,
                                       model = list(ma = c(psi)),
                                       prob = 0.5)


  shiftedMA1Array = centeredMA1Array + mean
  return (shiftedMA1Array)

}

