#' @title createCenteredBernNoise
#'
#' @name createCenteredBernNoise
#'
#' @aliases createCenteredBernNoise
#'
#' @description Create \code{b}, a.k.a. bandwidth given \code{n} as being a sample size
#'
#' @param n the sample size
#' @param prob the prob
#'
#' @return A scalar value of \code{b}.
#'
#' @examples bandwidthValue <- computeB(n = 8)
#'
#' @export

createCenteredBernNoise <- function(n, prob)
{
  bern <- rbinom(n,size = 1,prob = prob)
  centeredBern <- bern - prob
  return(centeredBern)
}
