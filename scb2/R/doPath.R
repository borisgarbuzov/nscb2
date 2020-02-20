#' @title doPath
#'
#' @name doPath
#'
#' @aliases doPath
#'
#' @description Creating \code{ma1CoefArray}, that is, the array of time variant coefficients, based on \code{tParArray} using a coeffficients function. If no coefFunction provided, \code{ma1CoefArray} vector equals to \code{tParArray} vector.
#'
#' @param directory directory.
#'
#' @return The vector of the array of time variant coefficients values corresponding to T parameter values.
#'
#' @examples
#'
#' createMA1CoefArray(coefFunction = sin, tParArray =  seq(from = 0, to = 1, length.out = 10))
#' createMA1CoefArray(coefFunction = sin, tParArray =  seq(from = 0, to = 1, by = 0.1))
#'
#' @export

doPath <- function(directory = "")
{
  #workingDirectory<-getwd()
  #splitDirectory <- data.frame(strsplit(workingDirectory,"/"))
  #tailDirectory <- tail(splitDirectory,1)

  #myPath <- "../../../output"

  #if(tailDirectory=="SCB")
  # {
  #  myPath <-"../output"
  # }
  myPath <- "output"
  if(directory != "")
  {
    myPath<-paste(myPath,directory,sep = "/")
  }

  return(myPath)
}
