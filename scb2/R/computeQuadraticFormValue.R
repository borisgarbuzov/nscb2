#' @title computeQuadraticFormValue
#'
#' @name computeQuadraticFormValue
#'
#' @aliases computeQuadraticFormValue
#'
#' @description Create \code{b}, a.k.a. bandwidth given \code{n} as being a sample size
#'
#' @param argumentVector the argumentVector
#' @param matrix the matrix
#'
#' @return A scalar value of \code{b}.
#'
#' @examples bandwidthValue <- computeB(n = 8)
#'
#' @export


computeQuadraticFormValue <-function(argumentVector, matrix)
{
  # may check dimensions

  tranposedArgumentVector <- t(argumentVector)
  quadratiFormValue <- (tranposedArgumentVector %*% matrix) %*% argumentVector
  return(as.numeric(quadratiFormValue))
}
