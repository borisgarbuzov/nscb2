testNwDenominatorBandwidthChange <- function(bandwidth,
                                              blockCount)
{
  cat("\nTesting \'tests_scb2_105_nwDenominatorBandwidthChange\' \n")

  cat("Test parameters:", "\n")
  cat("blockCount =", blockCount, "\n")
  cat("bandwidth =");print(bandwidth);cat("\n")

  path <- doPath("denominator_bandwith")
  for (bandwithIndex in bandwidth) {

    characterBandwith <- as.character(round(bandwithIndex,digits = 3))
    characterBandwith <- gsub("\\.","", characterBandwith)

    subtitle <- paste0("bandwidth = ",bandwithIndex)
    extentedArguments <- linspace(-1,2,1000)
    denominator <- array(data = 0,dim = length(extentedArguments))
    localArguments <- localLrvArguments(blockCount = blockCount)
    denominator <- nwDenominator(extentedArguments = extentedArguments,
                                 baseArguments = localArguments,
                                 bandwidth = bandwithIndex)
    fileName = "denominator_"
    fileName <- paste0(fileName,characterBandwith)
    saveJpg(fileName = fileName,path = path)
    plot(extentedArguments,denominator,type = "l",
         main = "NW denominator. Fixed x points, changeable bandwidth",
         sub = subtitle)
    graphics.off()


  }
  cat("End of test nwDenominatorBandwidthChange","\n")

  cat("=====================\n")
}
