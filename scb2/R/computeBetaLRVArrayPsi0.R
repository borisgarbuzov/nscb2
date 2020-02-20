#' @title computeBetaLRVArrayPsi0
#'
#' @name computeBetaLRVArrayPsi0
#'
#' @aliases computeBetaLRVArrayPsi0
#'
#' @description
#' @param size size
#' @param sigma \code{Sigma} parameter as being the regular sigma, a.k.a. std.
#' @param mean mean
#'
#'
#' @return
#'
#' @examples
#'
#'
#' @export
computeBetaLRVArrayPsi0<-function(size,
                                  mean,
                                  sigma,
                                  ...)
{
  betaLrv <- numeric(size-1)
  for(index in 1:size-1)
  {
    betaLrv[index]<-computeBetaLRVpsi0(lag = index-1,
                       mean = mean,
                       sigma = sigma)
  }
  return(betaLrv)
}
