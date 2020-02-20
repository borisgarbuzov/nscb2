#' @title saveProductCol
#'
#' @name saveProductCol
#'
#' @aliases saveProductCol
#'
#' @description Saving a two-dimensional array \code{productCol} to a CSV file saved to \code{"./export"} directory.
#'
#' @param dataframe A two-dimensional array \code{productCol}
#'
#' @return No data structures returned. Saving a CSV file located in \code{"./export"} directory.
#'
#' @examples
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' productCol <- createProductCol(original)
#' saveProductCol(productCol)
#'
#' @export

saveProductCol <- function(dataframe) {
  nameOfFile <-
    dir.create(file.path("./", "export"), showWarnings = FALSE)
  write.csv(dataframe, file = "export/productColExported.csv")
}
