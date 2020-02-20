#' @title createDMatrix
#'
#' @name createDMatrix
#'
#' @aliases createDMatrix
#'
#' @description  Creating a two-dimensional array of dimensions \code{c(size - 1, size - 1)} using a formula from the article.
#'
#' @param size The size of the one-dimensional array \code{original}..
#' @param sigma \code{Sigma} parameter as being the regular sigma, a.k.a. std.
#' @param psi The main argument passed to the model of \code{stats::arima.sim()}.
#'
#' @return Returning a two-dimensional array of dimensions \code{c(size - 1, size - 1)}
#'
#' @examples
#' createDMatrix(size = 10, sigma = 1, psi = 0.5)
#' 
#' @export

createDMatrix <- function(size,
                          sigma,
                          psi) {
  dMatrix <-  array(0, dim = c(size - 1, size - 1))
  d01 = (1 + psi ^ 4 + 3 * psi ^ 2) / ((psi ^ 2 + 1) ^ 2)
  d02 <- sigma ^ 4 * ((1 + psi ^ 2) ^ 2)
  d11 <-  psi ^ 2 * (psi ^ 2 - 1) / ((1 + psi ^ 2) ^ 4)
  d12 <- psi ^ 2 * sigma ^ 4


  # Dmatrix[1, 3], Dmatrix[2, 3] values to d02, d12
  # dMatrix[1, 2], dMatrix[2, 2], a.k.a. d_01, d_11

  dMatrix[1, 2] <- d01
  dMatrix[2, 2] <- d11
  dMatrix[1, 3] <- d02
  dMatrix[2, 3] <- d12

  dMatrix <- dMatrix / (sigma ^ 4 * ((1 + psi ^ 2) ^ 2))
  dMatrix [, 4:dim(dMatrix)[2]] = dMatrix [, 3]
  dMatrix
}


