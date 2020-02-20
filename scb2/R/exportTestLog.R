#' @title exportTestLog
#
#' @name exportTestLog
#'
#' @aliases exportTestLog
#'
#' @description Drawing a barplot of side-by-side values of \code{dMatrix} and \code{dHatMatrix} values. Exporting it to a JPEG file saved to \code{"./plots"} directory.
#'
#' @param dMatrix A dMatrix
#' @param dHatMatrix A dHatMatrix
#'
#' @return No data structures returned. Saving JPEG file located at \code{"./plots"} directory.
#'
#' @examples
#' dMatrix <- createDMatrix(size = 10, sigma = 1, psi = 0.5)
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' betaArray <- createBetaArray <- function(original, rho = 0.5)
#' dHatMatrix <- createDHatMatrix(betaArray, size = 10)
#' drawDvsDHat(dMatrix, dHatMatrix)
#'
#' @export

exportTestLog <- function() {
  dir.create(file.path("./", "export"), showWarnings = FALSE)

  curTime <- Sys.time()
  curTime <- gsub(pattern = " ", replacement = "_", x = curTime)
  curTime <- gsub(pattern = ":", replacement = "-", x = curTime)

  full.name = paste0("test_", curTime, ".log")
  txt.path <- file.path("./", "export", full.name)

  library(devtools)
  sink(file = txt.path,
       type = c("output", "message"),
       split = TRUE,
       append = TRUE)
  devtools::build()
  devtools::load_all()
  devtools::test()
  sink()
}
