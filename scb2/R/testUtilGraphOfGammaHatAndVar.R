testUtilGraphOfGammaHatAndVar <- function(sampleSize,
                                          tPar,
                                          tParCount,
                                          sigma,
                                          mean,
                                          lag){
  cat("\n Testing \'tests_scb2_189_graphOfGammaHatAndVar\ \n")

  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("tPar =", tPar, "\n")
  cat("tParCount =", tParCount, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")
  cat("lag =", lag, "\n")

  Start <- Sys.time()

  # Check if this directory exists
  if(!dir.exists("output"))
  {
    dir.create("output", recursive = TRUE)
  }

  # create horizontal sample and take a row corresponding to a given t
  diagHorizSamplePair <- createDiagHorSamplesScaledNoise(sampleSize = sampleSize,
                                                         tParCount = tParCount,
                                                         mean = mean,
                                                         sigma = sigma)
  horizontal2dSample <- diagHorizSamplePair[[1]][tPar * tParCount,]

  # create empty vectors fro gammaHat and var values
  gammaHatVec <- c()
  varianceVec <- c()

  for(subsampleSize in 2:length(horizontal2dSample)){
    subsample <- horizontal2dSample[1:subsampleSize]
    gammaHatVec <- c(gammaHatVec, computeGammaHat(sample = subsample, lag = lag))
    varianceVec <- c(varianceVec, var(subsample))
  }

  trueGamma <- computeGammaScaledNoise(tPar = tPar, sigma = sigma, lag = lag)

  range = c(min(gammaHatVec, 0), max(gammaHatVec, 0))

  # create filename
  fileName <- paste0("output/graphOfGammaHatAndVar, sampleSize=", sampleSize,
                     "tPar=", tPar, "lag=", lag, ".svg")

  # plot graph of gamma hat and variance
  svg(fileName)
  plot(x = gammaHatVec, type = "l", col = "red", xlab = "Index",
       ylab = "Value", ylim = range)
  abline(h = trueGamma, lwd = 2)

  gammaHat <- paste("gamma hat with", lag, "lag")

  # if lag equals to 0 we draw variance and add it to the legend
  if(lag == 0){
    lines(varianceVec, col = "blue")
    legend("topright", legend = c("variance", gammaHat, "theoretical gamma"),
           col = c("blue", "red", "black"), lty=1, cex = 0.8)
    title(main = "Graph of gamma hat and variance")
  }
  else{
    legend("topright", legend = c(gammaHat, "theoretical gamma"),
           col = c("red", "black"), lty=1, cex = 0.8)
    title(main = "Graph of gamma hat")
  }

  sampleSizeLegend <- paste("Sample size =", sampleSize)
  tParLegend <- paste("tPar =", tPar)
  theoreticalGamma <- paste("theoretical gamma =", trueGamma)

  legend("topleft", legend = c(sampleSizeLegend, tParLegend, theoreticalGamma),
         cex = 0.8)

  dev.off()

  # plot line from horizontal sample
  fileName <- paste0("output/graphOfHorizLineForGamma, sampleSize=", sampleSize,
                     "tPar=", tPar, "lag=", lag, ".svg")

  svg(fileName)

  plot(x = horizontal2dSample, type = "l", xlab = "Index", ylab = "Value",
       main = "Graph of horizontal sample line")

  legend("topleft", legend = c(sampleSizeLegend, tParLegend), cex = 0.8)

  dev.off()

  End <- Sys.time()
  duration <- End - Start

  cat("Duration =", duration, "\n")

  cat("End of test graphOfGammaHatAndVar", "\n")

  cat("=====================\n")
}
