#' @title cutNB
#'
#' @name cutNB
#'
#' @aliases cutNB
#'
#' @description Creating \code{ma1CoefArray}, that is, the array of time variant coefficients, based on \code{tParArray} using a coeffficients function. If no coefFunction provided, \code{ma1CoefArray} vector equals to \code{tParArray} vector.
#'
#' @param tParArray a T parameter, a.k.a. a sleeper parameter, a sequence of numbers {0, 1}.
#' @param coefFunction a coeffficients function, which is an underlying function used to generate \code{ma1CoefArray} vector.
#'
#' @return The vector of the array of time variant coefficients values corresponding to T parameter values.
#'
#' @examples
#'
#' createMA1CoefArray(coefFunction = sin, tParArray =  seq(from = 0, to = 1, length.out = 10))
#' createMA1CoefArray(coefFunction = sin, tParArray =  seq(from = 0, to = 1, by = 0.1))
#'
#' @export

cutNB <- function(original,batchSize)
{
  size <- length(original)
  if((size%%batchSize)!=0)
  {
    stop("size:",size," batchSize: ", batchSize,"\n batchSize is not compatible with this size")
  }
  batchCount <- size/batchSize
  matrixNB <- matrix(data = NA,nrow = batchCount,ncol = batchSize)
  firstIndex <- 1
  lastIndex <- batchSize
  for(index in 1:batchCount)
  {
    matrixNB[index,]<-original[firstIndex:lastIndex]
    firstIndex <- firstIndex+batchSize
    lastIndex <- lastIndex+batchSize
  }

  return(matrixNB)
}
