#' @title saveBand
#'
#' @name saveBand
#'
#' @aliases saveBand
#'
#' @description Save created bands to jpg file as graphic
#'
#' @param band
#' @param corArray
#' @param sampleSize
#' @param replicationCount
#' @param lag
#' @param superReplicationCount
#' @param nonCoverageProbability
#'
#' @return
#'
#' @examples
#'
#'@export

saveBand <- function(band,
                     corArray,
                     sampleSize,
                     replicationCount,
                     lag,
                     superReplicationCount,
                     nonCoverageProbability,
                     fileName="")
{
  bandwidth=computeB(sampleSize=sampleSize)
  #cat ("\n saveBand is called")
  # forming arrays to draw
  middle  <- (band[ , 1] + band[ , 2]) / 2
  consolidatedBands <- data.frame(lower  = band[, 1],
                                  middle = middle,
                                  upper  = band[, 2],
                                  corArray = corArray)
  #globMin <- min(apply(consolidatedBands, 2, min))
  #globMax <- max(apply(consolidatedBands, 2, max))
  #globSd <- max(apply(consolidatedBands, 2, sd))
  #yMinMargin <- globMin - 2 * globSd
  #yMaxMargin <- globMax + 4 * globSd
  yMinMargin <- min(consolidatedBands)
  yMaxMargin <- max(consolidatedBands)
  yMinMargin <- yMinMargin + yMinMargin*0.1
  yMaxMargin <- yMaxMargin + yMaxMargin*0.4
  # forming filenames
  fileName <- paste(fileName,"Band&Cor",sep = "_")
  fileName <- paste(fileName,
                    "ss", sampleSize,
                    "l", lag,
                    "b", round(bandwidth, digits = 1 ), sep = "_")
  fileName <- paste(fileName,
                    "a",nonCoverageProbability,
                    "rC", replicationCount,
                    "sC", superReplicationCount, sep = "_")
  fileName <- timestampGenerator(fileName)

  xLab <- "tParArray"

  subTitle <- paste(xLab,
                    "\n sampleSize = ", sampleSize,
                    ", lag = ", lag,
                    ", bandwidth = ", round(bandwidth, digits = 2),
                    ",\n replicationCount = ", replicationCount,
                    ", superRep = ", superReplicationCount,
                    ", Alpha = ", nonCoverageProbability,
                    sep = "")
  xMinMargin <- 0
  xMaxMargin <- 1

  directory <- "bands"

  path <- doPath(directory = directory)

  # saving data to CSV
  consolidatedBands <- data.frame(consolidatedBands,corArray,sampleSize,bandwidth,
                                  replicationCount,
                                  lag,
                                  superReplicationCount,
                                  nonCoverageProbability)
  saveCVS(fileName = fileName, path = path, dataToSave = consolidatedBands)

  tParCount <- length(corArray)
  tParArray <- createTParArray(tParCount)

  # opening a graphical device and saving the drawing to it
  saveJpg(fileName = fileName, path = path)
  plot(x = tParArray,
       y = consolidatedBands$lower,
       type = "l",
       col = "blue",
       xlim = c(xMinMargin, xMaxMargin),
       ylim = c(yMinMargin, yMaxMargin),
       xlab = "",
       ylab = "Correlation",
       yaxs = "i")
  title(main = "Band and Correlation", sub = subTitle)
  abline(v=bandwidth,lty=5)
  abline(v=(1-bandwidth),lty=5)
  lines(x = tParArray, y = consolidatedBands$middle, type = "l", col = "brown")
  lines(x = tParArray, y = consolidatedBands$upper, type = "l", col = "green")
  lines(x = tParArray, y = consolidatedBands$corArray, type = "l", col = "red")
  lineArray <- c("Upper", "Middle", "Lower", "Correlation")
  legend("topright",
         title = "Correlation",
         lineArray,
         fill = c("green", "brown", "blue", "red"))
  graphics.off()
}
