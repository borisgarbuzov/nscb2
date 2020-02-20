#' @title computeBetaLRVpsi0
#'
#' @name computeBetaLRVpsi0
#'
#' @aliases computeBetaLRVpsi0
#'
#' @description
#' @param mean mean
#' @param sigma \code{Sigma} parameter as being the regular sigma, a.k.a. std.
#' @param lag lag
#'
#' @return
#'
#' @examples
#'
#'
#' @export
computeBetaLRVpsi0  <- function(lag,
                                mean,
                                sigma)
{
  if(lag == 0)
  {
    return(0)
  }
  else
  {
    return (1 + 4 * (mean^2 / sigma^2))
  }
}
