#' @title drawCvsCHat
#
#' @name drawCvsCHat
#'
#' @aliases drawCvsCHat
#'
#' @description Drawing a barplot of side-by-side values of \code{cMatrix} and \code{cHatMatrix} values. Exporting it to a JPEG file saved to \code{"./plots"} directory.
#'
#' @param cMatrix A cMatrix
#' @param cHatMatrix A cHatMatrix
#'
#' @return No data structures returned. Saving JPEG file located at \code{"./plots"} directory.
#'
#' @examples
#' cMatrix <- createCMatrix(size = 10, sigma = 1, psi = 0.5) 
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' productCol <- createProductCol(original)
#' cHatMatrix <- createCHatMatrix(productCol, size = 10)
#' drawCvsCHat(cMatrix, cHatMatrix)
#'
#' @export

drawCvsCHat <-  function(cMatrix, cHatMatrix) {
  iCount = min(dim(cMatrix)[2],
               dim(cHatMatrix)[2])

  for (i in 1:iCount) {
    full.name = paste0("barplot_cHatMatrix_vs_cMatrix_lag_", i, ".jpeg")
    plot.path <- file.path("./", "plots", full.name)
    jpeg(plot.path)
    tmpMin <- min(cHatMatrix[, i], cMatrix[, i])
    tmpMax <- max(cHatMatrix[, i], cMatrix[, i])
    tmpMatrix <- rbind(cHatMatrix[, i][1:iCount],
                       cMatrix[, i][1:iCount])
    rownames(tmpMatrix) <- c("C Hat", "C")
    barplot(tmpMatrix,
      beside = T,
      ylim = c(tmpMin - 1, tmpMax + 1),
      xlim = c(0, iCount + 2),
      col = c("dark grey", "black"),
      legend = rownames(tmpMatrix),
      main = bquote(paste(
        "C matrix vs ", hat(C), " matrix, lag = ", .(i - 1))))
    graphics.off()
  }
}
