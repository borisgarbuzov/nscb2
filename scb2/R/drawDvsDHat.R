#' @title drawDvsDHat
#
#' @name drawDvsDHat
#'
#' @aliases drawDvsDHat
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

drawDvsDHat <-  function(dMatrix, dHatMatrix) {
  iCount = min(dim(dMatrix)[2],
               dim(dHatMatrix)[2])
  for (i in 1:iCount) {
    full.name = paste0("barplot_dMatrix_vs_dHatMatrix_lag_", i - 1, ".jpeg")
    plot.path <- file.path("./", "plots", full.name)
    jpeg(plot.path)
    tmpMin <- min(dHatMatrix[, i], dMatrix[, i])
    tmpMax <- max(dHatMatrix[, i], dMatrix[, i])
    tmpMatrix <- rbind(dHatMatrix[, i][1:iCount],
                       dMatrix[, i][1:iCount])
    rownames(tmpMatrix) <- c("D Hat", "D")
    barplot(tmpMatrix,
      beside = T,
      ylim = c(tmpMin - 1, tmpMax + 1),
      xlim = c(0, iCount + 2),
      col = c("dark grey", "black"),
      legend = rownames(tmpMatrix),
      main = bquote(paste(
        "D matrix vs ", hat(D), " matrix, lag = ", .(i - 1))))
    graphics.off()
  }
}
