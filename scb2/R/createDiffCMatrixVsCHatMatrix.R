#' @title createDiffCMatrixVsCHatMatrix
#'
#' @name createDiffCMatrixVsCHatMatrix
#'
#' @aliases createDiffCMatrixVsCHatMatrix
#'
#' @description Creating a two-dimensional array of dimensions that cover both \code{cMatrix} and \code{cHatMatrix} data area, using \code{(c(min(dim(cMatrix)[1], dim(cHatMatrix)[1]), c(min(dim(cMatrix)[2], dim(cHatMatrix)[2]),)}.
#'
#' @param cMatrix A cMatrix
#' @param cHatMatrix A cHatMatrix
##'
#' @return Returning a two-dimensional array.
#'
#' @examples
#' cMatrix <- createCMatrix(size = 10, sigma = 1, psi = 0.5)
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' productCol <- createProductCol(original)
#' cHatMatrix <- createCHatMatrix(productCol, size = 10)
#' createDiffCMatrixVsCHatMatrix(cMatrix, cHatMatrix)
#'
#' @export

createDiffCMatrixVsCHatMatrix <- function(cMatrix,
                                          cHatMatrix) {
    matDim <- c(min(dim(cMatrix)[1], dim(cHatMatrix)[1]),
              min(dim(cMatrix)[2], dim(cHatMatrix)[2]))
    # diff_cMatrix_vs_cHatMatrix <- array(NA, dim = c(matDim[1], matDim[2]))
    diffCMatrixVsCHatMatrix <- cMatrix[1:matDim[1], 1:matDim[2]] -
                                  cHatMatrix[1:matDim[1], 1:matDim[2]]
    iCount = dim(diffCMatrixVsCHatMatrix)[2]

  # Exporting plots of differences
  for (i in 1:iCount) {
    dir.create(file.path("./", "plots"), showWarnings = FALSE)
    full.name = paste0("diff_cMatrix_vs_cHatMatrix_lag_", i - 1, ".jpeg")
    plot.path <- file.path("./", "plots", full.name)
    jpeg(plot.path)
    # Need to be flattened to vectors

    ithElement <- unlist(diffCMatrixVsCHatMatrix[, i])
    barplot(
      ithElement,
      xlim = c(0, (length(ithElement) + 2)),
      xlab = "Lag Count",
      ylab = "C vs CHat difference",
      axes = TRUE,
      main = bquote(paste(
        "Difference of C vs ", hat(C), " matrices, ",
        "lag = ", .(i - 1)
      ))
    )
    graphics.off()
  }
    diffCMatrixVsCHatMatrix
}
