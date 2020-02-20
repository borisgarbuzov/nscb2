#' @title createDiffDMatrixVsDHatMatrix
#'
#' @name createDiffDMatrixVsDHatMatrix
#'
#' @aliases createDiffDMatrixVsDHatMatrix
#'
#' @description Creating a two-dimensional array of dimensions that cover both \code{dMatrix} and \code{dHatMatrix} data area.
#'
#' @param dMatrix A dMatrix
#' @param dHatMatrix A dHatMatrix
#'
#' @return Returning a two-dimensional array.
#'
#' @examples
#' dMatrix <- createDMatrix(size = 10, sigma = 1, psi = 0.5)
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' betaArray <- createBetaArray <- function(original, rho = 0.5)
#' dHatMatrix <- createDHatMatrix(betaArray, size = 10)
#' createDiffDMatrixVsDHatMatrix(dMatrix, dHatMatrix)
#'
#' @export

createDiffDMatrixVsDHatMatrix <- function(dMatrix,
                                          dHatMatrix) {
  matDim <- c(min(dim(dMatrix)[1], dim(dHatMatrix)[1]),
              min(dim(dMatrix)[2], dim(dHatMatrix)[2]))

  dMatrixToCompare <- dMatrix[1:matDim[1], 1:matDim[2]]
  dHatMatrixToCompare <- dHatMatrix[1:matDim[1], 1:matDim[2]]
  diffDMatrixVsDHatMatrix <- dMatrixToCompare - dHatMatrixToCompare

  # # Exporting plots of differences
  iCount = dim(diffDMatrixVsDHatMatrix)[2]

  for (i in 1:iCount) {
  dir.create(file.path("./", "plots"), showWarnings = FALSE)
    full.name = paste0("diffDMatrixVsDHatMatrix_lag_", i - 1, ".jpeg")
    plot.path <- file.path("./", "plots", full.name)
    jpeg(plot.path)
    # Need to be flattened to vectors
    ithElement <- unlist(diffDMatrixVsDHatMatrix[, i])
    barplot(
      ithElement,
      xlim = c(0, (length(ithElement) + 2)),
      xlab = "Lag Count",
      ylab = "D vs DHat difference",
      axes = TRUE,
      main = bquote(paste(
        "Difference of D and ", hat(D), " matrices, ",
        "lag = ", .(i - 1)
      ))
    )
    graphics.off()
  }

  diffDMatrixVsDHatMatrix
}

