#' @title createBetaArray
#'
#' @name createBetaArray
#'
#' @aliases createBetaArray
#'
#' @description Creating a two-dimensional array of dimensions \code{c(size - 1, size)}.
#'
#' @param original A one-dimensional array created using \code{stats::arima.sim()}, passing \code{size} as the length of the array.
#' @param sigma \code{Sigma} parameter as being the regular sigma, a.k.a. std.
#' @param psi he main argument passed to the model of \code{stats::arima.sim()}.
#'
#' @return Returning a two-dimensional array of dimensions \code{c(size - 1, size)}.
#'
#' @examples
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' createBetaArray <- function(original, rho = 0.5)
#'
#' @export

createBetaArray <- function(original,
                            psi,
                            sigma) {
  size <- length(original)

  rho <- createRho(size = size,
                   psi = psi)

  gamma <- createGamma(psi = psi,
                       sigma = sigma)
  gamma0 <- gamma[1]

  betaArray <- array(NA, dim = c(size - 1, size))

  lag = 1
  while ((size - lag) > 0) {

    for (rowIndex in 1:(size - 1)) {

      for (colIndex in 1:(size - lag + 1)) {

        myBeta =
        original[rowIndex] *
          (original[colIndex + lag - 1] - rho[lag] * original[rowIndex])
          # if createRho() created using version 1, with 0 offset,
          # so that rho <- c(1, 0.12345, 0, 0, 0), then
          # (original[colIndex + lag - 1] - rho[rowIndex + 1] * original[rowIndex])

        betaArray[rowIndex, colIndex] <- myBeta

      }
      lag = lag + 1
    }
  }
  betaArray [, 1] = 0
  betaArray = betaArray / gamma0
  # betaArray <- array(as.numeric(unlist(betaArray)), dim = c(size-1, size))
  # betaArray <- as.data.frame(betaArray)
  # colnames(betaArray) <- as.character(0:(length(original) - 1))
  betaArray
}

