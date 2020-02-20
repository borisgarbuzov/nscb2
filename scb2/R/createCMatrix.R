#' @title createCMatrix
#'
#' @name createCMatrix
#'
#' @aliases createCMatrix
#'
#' @description Creating a two-dimensional array of dimensions \code{c(size - 1, size - 1)} using a formula from the article.
#'
#' @param size The size of the one-dimensional array \code{original}..
#' @param sigma \code{Sigma} parameter as being the regular sigma, a.k.a. std.
#' @param psi he main argument passed to the model of \code{stats::arima.sim()}.
#'
#' @return Returning a two-dimensional array of dimensions \code{c(size - 1, size - 1)}
#'
#' @examples
#' createCMatrix(size = 10, sigma = 1, psi = 0.5)
#'
#' @export

createCMatrix <- function(size,
                          sigma,
                          psi) {
  cMatrix <- array(0, dim = c(size - 1, size - 1))
  c00 <- 2 * sigma ^ 4 * ((1 + psi ^ 2) ^ 2)
  c01 <- sigma ^ 4 * (1 + psi ^ 4 + 3 * psi ^ 2)
  c10 <- 2 * sigma ^ 4 * psi ^ 2

  c11 <- psi ^ 2 * sigma ^ 4
  c02 <- sigma ^ 4 * ((1 + psi ^ 2) ^ 2)

  # Filling the entire first line with c02 value
  cMatrix[1,] <- c02
  # Filling the entire second line with c11 value
  cMatrix[2,] <- c11
  # Changing Cmatrix[1, 1] value to c00
  cMatrix[1, 1] <- c00
  # Changing Cmatrix[2, 1] value to c10
  cMatrix[2, 1] <- c10
  # Changing Cmatrix[1, 2] value to c01
  cMatrix[1, 2] <- c01
  cMatrix
}
