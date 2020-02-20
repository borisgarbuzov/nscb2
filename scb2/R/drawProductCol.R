#' @title drawProductCol
#
#' @name drawProductCol
#'
#' @aliases drawProductCol
#'
#' @description Drawing a plot of \code{ProductCol} values. Exporting it to a JPEG file saved to \code{"./plots"} directory.
#'
#' @param productCol A productCol two-dimensional array.
#' @param size The size of the one-dimensional array. 
#' @param mean The mean.
#' @param sigma The sigma .
#' @param lagCount The lagCount .
#' @param darkestColor The darkest color of the canvas that is going to be used to display the tails of the \code{productCol} columns. The smaller \code{lagCount} is, the darker is the color used to display the tail.
#' @param lightestColor The lightest color of the canvas that is going to be used to display the tails of the \code{productCol} columns. The larger \code{lagCount} is, the lighter is the color used to display the tail.
#'
#' @return No data structures returned. Saving a JPEG file located at \code{"./plots"} directory.
#'
#' @examples
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' productCol <- createProductCol(original)
#' drawProductCol(productCol, size = 10, mean = 0, sigma = 1, lagCount = 2, darkestColor = "dark blue", lightestColor = "white"
#'
#' @export

drawProductCol <- function(productCol,
                           size,
                           mean,
                           sigma,
                           lagCount,
                           darkestColor = "dark blue",
                           lightestColor = "white"
) {
  colfunc <- colorRampPalette(c(darkestColor, lightestColor))
  # pie(rep(1, size), col = colfunc(size))

  # The array of RGB codes
  colfunc(size)

  dir.create(file.path("./", "plots"), showWarnings = FALSE)
  # Forming a path to the exported products image
  full.name = paste0("productCol_",
                     "size_",
                     size,
                     "_mean_",
                     mean,
                     "_sigma_",
                     sigma,
                     ".jpeg")
  plot.path <- file.path("./", "plots", full.name)
  jpeg(plot.path)
  matplot(
    y = productCol[, 1:lagCount],
    type = 'l',
    lty = 1,
    col = colfunc(lagCount)
  )
  graphics.off()
}
