#' @title cutOB
#'
#' @name cutOB
#'
#' @aliases cutOB
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

cutOB <- function(original,batchSize)
{
  size <- length(original)
  batchCount <- size - batchSize +1
  matrixOB <- matrix(data = NA,nrow =batchCount ,ncol = batchSize)
  firsCol <- 1
  for(index in batchSize:size)
  {
    matrixOB[firsCol,]<-original[firsCol:index]
    firsCol <- firsCol + 1
  }

  #cat ("\n matrixOB = \n")
  #print (matrixOB)
  #cat ("\n ")

  return(matrixOB)
}
