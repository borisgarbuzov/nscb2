#' @title drawMatrix
#
#' @name drawMatrix
#'
#' @aliases drawMatrix
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

drawMatrix <- function(matrix) {
  matrix <- apply(matrix, 2, rev)

  nColMatrix <- ncol(matrix)
  colorSeqAsNumbers <- unique(as.factor(matrix))
  lengthColorSeqAsNumbers <- length(colorSeqAsNumbers)

  curTime <- gsub(" ", "_", Sys.time())
  curTime <- gsub(":", "-", curTime)
  fileName <- paste0("matrix_", curTime, ".jpeg")

  if (!dir.exists("./plots")) {
    dir.create("./plots")
  }

  plotPath <- file.path("./", "plots", fileName)

  jpeg(plotPath)
  image(1:nColMatrix, # x
        1:nColMatrix, # y
        matrix,   # the object
        main = "Matrix",
        # sub = paste0("size = ", size, ", batchSize = ", batchSize),
        col = terrain.colors(lengthColorSeqAsNumbers), # color palette
        axes = F)
  axis(2, at = 1:nColMatrix, labels = nColMatrix:1)
  axis(3, at = 1:nColMatrix, labels = 1:nColMatrix)
  graphics.off()

}
