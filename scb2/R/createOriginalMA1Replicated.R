#' @title createOriginalMA1Replicated
#'
#' @name createOriginalMA1Replicated
#'
#' @aliases createOriginalMA1Replicated
#'
#' @description Creating a two-dimensional array using \code{createOriginalMA1()}, as an underlyin function, passing \code{replicationCount} as the outer counter, \code{size}, \code{sigma} and \code{psi} (\code{psi} being the argument of the model).
#'
#' @param replicationCount A number of replications, other words, an amount of times \code{createOriginalMA1()} is going to be executed.
#' @param size The size of the future one-dimensional array.
#' @param psi The main argument passed to the model of \code{stats::arima.sim()}.
#' @param sigma \code{Sigma} parameter as being the regular sigma, a.k.a. std.
#' @param mean \code{mean} parameter as being the regular mean.
#'
#' @return  Returninng a two-dimensional array of dimensions \code{c(replicationCount, size)}.
#'
#' @examples
#' createOriginalMA1Replicated (replicationCount = 10, size = 10, psi = 0.5, sigma = 1)
#'
#' @export

createOriginalMA1Replicated <- function(replicationCount,
                                        size,
                                        psi,
                                        sigma,
                                        mean) {

  originalMA1Replicated <- array(NA, dim = c(replicationCount,
                                             size))

  for (i in 1:replicationCount) {
    originalMA1Replicated[i, ] <- createOriginalMA1(size,
                                                    psi,
                                                    sigma,
                                                    mean)
  }

  originalMA1Replicated
}
