#' @title createLRVof3dArray
#'
#' @name createLRVof3dArray
#'
#' @aliases createLRVof3dArray
#'
#' @description Computing a long-run variance of a three-dimensional array.
#'
#' @param array3d  A \code{productColReplicated} three-dimensional array.
#'
#' @return An array of the LRV (long-run variance) values of each column.
#'
#' @examples
#' originalReplicated <- createOriginalMA1Replicated (replicationCount = 10, size = 10, psi = 0.5, sigma = 1)
#' productColReplicated <- createProductColReplicated(originalReplicated, size = 10, replicationCount = 10)
#' createLRVof3dArray(productColReplicated)
#'
#' @export

createLRVof3dArray <- function(array3d) {
  # array3d is a 3-D array of the following setup:
  # array3d[rowCount, colCount, replicationCount]
  # reference to one level down
  colCount = dim (array3d) [2]
  # subtracted 1 colCount-1 because it complained about dimensions
  lrvArray = array (NA, dim = (colCount-1))
  for (colIndex in 1:(colCount-1)) {
  # lrvArray = array (NA, dim = (colCount))
  # for (colIndex in 1:(colCount))
    transposed2d <- t(array3d[ , colIndex, ])
    lrvArray [colIndex] = createLRVof2dArray(transposed2d)
  }
  lrvArray
}
