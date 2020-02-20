#' @title createBetaArrayReplicated
#'
#' @name createBetaArrayReplicated
#'
#' @aliases createBetaArrayReplicated
#'
#' @description Creating a three-dimensional array of dimensions \code{c(size - 1, size, replicationCount)} using \code{createBetaArray()} as an underlying function.
#'
#' @param originalReplicated A three-dimensional array of dimensions \code{c(replicationCount, size)}.
#' @param psi A \code{psi} value.
#' @param sigma \code{Sigma} parameter as being the regular sigma, a.k.a. std.
#'
#' @return Returning a three-dimensional array of dimensions \code{c(size - 1, size, replicationCount)}
#'
#' @examples
#' originalReplicated <- createOriginalMA1Replicated(replicationCount = 10, size = 10, psi = 0.5, sigma = 1)
#' createBetaArrayReplicated(originalReplicated, size = 10, replicationCount = 10, rho = 0.5)
#'
#' @export

createBetaArrayReplicated <- function(originalReplicated,
                                      psi,
                                      sigma)
{
  maxLag <- length(originalReplicated[1,])
  replicationCount <- dim(originalReplicated)[1]
  size <- dim(originalReplicated)[2]

  betaArrayReplicated  <- array(NA, dim =
                  c(size - 1, maxLag, replicationCount))

  for (i in 1:replicationCount)
  {
    betaArrayReplicated[ , , i] <- createBetaMatrix(sample = originalReplicated[i, ],
                                                    psi = psi,
                                                    sigma = sigma,
                                                    maxLag = maxLag-1)
  }

  betaArrayReplicated
}
