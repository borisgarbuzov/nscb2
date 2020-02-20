#' @title createCHatMatrixInALoop
#'
#' @name createCHatMatrixInALoop
#'
#' @aliases createCHatMatrixInALoop
#'
#' @description createCHatMatrixInALoop
#'
#' @param productCol productCol
#' @param size size
#'
#' @return cHatMatrixInALoop
#'
#' @examples
#'
#' @export



createCHatMatrixInALoop <- function(productCol,
                                    size) {
  # Eliminating all NA's
  x <- apply(productCol, MARGIN = 2, na.exclude)

  # CReating an empty list
  cHatList <- vector("list", size-1)

  # Filling cHatList with ACF values
  for (i in 0:(size - 2)) {
    backtick <- '\x60'
    offsetName <- paste0("x$", backtick, i, backtick)
    xi <- eval(parse(text = offsetName))
    xii <- acf(xi, type = "covariance")
    cHatList[[i+1]] <- as.vector(unlist(xii$acf))
  }

  # # Building the final matrix,
  # # complementing the missing values with NA's
  # cHatMatrix <- array(0, dim = c(size-1, size-1))
  #
  # for (i in 1:(size - 1)) {
  #   difLength <- size - 1 - length(unlist(cHatList[i]))
  #   ifelse(
  #     difLength == 0,
  #     cHatMatrix[ , i] <- unlist(cHatList[i]),
  #     cHatMatrix[ , i] <- c(unlist(cHatList[i]),
  #                          rep(0, difLength)))
  # }

  cHatList
}
