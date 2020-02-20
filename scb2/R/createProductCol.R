#' @title createProductCol
#'
#' @name createProductCol
#'
#' @aliases createAlpha
#'
#' @description Creating a two-dimensional upper-triangle-like array of dimensions \code{c(length(original), length(original))}. Each value in a cell \code{productCol[i, i]} is a product of \code{original[i] * original[i]}.
#'
#' @param original A one-dimensinal array \code{original} of length \code{size}.
#'
#' @return Returning a two-dimensional upper-triangle-like array of dimensions \code{c(length(original), length(original))}.
#'
#' @examples
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' createProductCol(original)
#'
#' @export

createProductCol <- function(original) {
  lengthOriginal <- length(original)
  productCol  <- matrix(NA, nrow = lengthOriginal,
                        ncol = lengthOriginal)

  # Filling the upper diagonal with product values
  productCol [lengthOriginal, 1] = original[lengthOriginal] ^ 2

  lag = 1
  while ((lengthOriginal - lag) > 0) {
    for (rowIndex in 1:(lengthOriginal - 1)) {
      for (colIndex in 1:(lengthOriginal - lag + 1)) {
        productCol[rowIndex, colIndex] <-
          original[rowIndex] * original[colIndex + lag - 1]
      }
      lag = lag + 1
    }
  }
  productCol <- as.data.frame(productCol)
  colnames(productCol) <- as.character(0:(lengthOriginal - 1))

  productCol
}
