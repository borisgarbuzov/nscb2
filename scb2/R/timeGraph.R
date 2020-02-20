timeGraph <- function(infoArray, fileName){
  # create file for graphic
  graphFileName <- paste0(fileName, ".svg")

  # create graphic
  svg(graphFileName)
  par(mar=c(5, 7, 4, 2))
  plot(x = infoArray[, 1], y = infoArray[, 2], type = "b", col = "red",
       xlab = "Iteration", yaxt = "n", ylab = "", main = "Graph of Time")

  # show time in format "H:M:S" in y-axis
  y <- as.POSIXct(x = infoArray[, 2], origin = "1970-01-01", tz = "GMT")
  axis.POSIXct(side = 2, x = y, format = "%H:%M:%OS3", las = 2)
  mtext("Time", side=2, line=6)

  # prepare data to show on legend
  numberOfIterations <- paste0("Iterations (# points): ", length(infoArray[, 1]))
  maxTime <- paste0("max time: ", format(.POSIXct(max(infoArray[, 2]), tz="GMT"),
                                       "%H:%M:%OS3"))
  totalTime <- paste0("total time: ",
                      format(.POSIXct(sum(infoArray[, 2]), tz="GMT"),
                             "%H:%M:%OS3"))
  legend("topleft", legend = c(numberOfIterations, maxTime, totalTime),
         cex = 0.8)
  dev.off()
}
