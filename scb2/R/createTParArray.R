#' @title createTParArray
#'
#' @name createTParArray
#'
#' @aliases createSleeper
#'
#' @description Create \code{T parameter array}.
#'
#' @param tParCount the desired length of \code{T parameter} vector.
#'
#' @return The vector of \code{T parameter array}.
#'
#' @examples
#' tParCount = 10
#' createTParArray(tParCount = tParCount)
#'
#' @export

createTParArray <- function(tParCount)
{
  if(tParCount <= 1)
  {
    stop("\ntParCount is 1 or smaller, whereas it should be 2 or greater")
  }
  tParCount <- tParCount - 1

  tParArray <- seq(from = 0,
                   to   = 1 - 1 / tParCount,
                   by   = 1 / tParCount)
  tParArray <- c(tParArray,1)
}
