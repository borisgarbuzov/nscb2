#' @title createLRVof2dArray
#'
#' @name createLRVof2dArray
#'
#' @aliases createLRVof2dArray
#'
#' @description Computing a long-run variance of a two-dimensional array (column-wise).
#'
#' @param array2d A \code{productCol} two-dimensional array.
#'
#' @return A scalar value of the long-run variance of a two-dimensional array.
#'
#' @examples
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' productCol <- createProductCol(original)
#' createLRVof2dArray(productCol)
#'
#' @export

createNonCenteredLRVof2dArray <- function(array2d) {
  # for each line we calculate average
  # and take variance  of those averages
  # multiply the result by a sqrt of a row count
  # Issue of rows and columns
  # Bars for each row
  # Then variance for all the results
  # corrected 1 to 2
  # here we do not transpose because it was already transposed on 3d level
  naCountInARowVector = rowSums(is.na(array2d))

  naCountInARow = naCountInARowVector[1]
  colCountNoNA = dim(array2d) [2] - naCountInARow
  array2dNoNA <- array2d[, 1:colCountNoNA]
  rowMeansArray <- rowMeans(array2dNoNA)

  lrv <- colCountNoNA * mean(rowMeansArray^2)
  # Commented out at Nov. 3
  # supposed that was the reason we have
  # productColReplicated pictures broken
  # (shifted down, instead of being
  # equally distributed around the horyzontal line)
  # rowMeansArray <- rowMeans(array2d, na.rm = T)
  # lrv <- sqrt(dim(array2d)[1]) * var(rowMeansArray)
}


