testUtilGraphOfRhoHat <- function(sampleSize,
                                  tPar,
                                  tParCount,
                                  sigma,
                                  mean,
                                  lag){
  cat("\n Testing \'tests_scb2_190_graphOfRhoHat\ \n")

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

  # create empty vector fro rhoHat
  rhoHatVec <- c()

  for(subsampleSize in 2:length(horizontal2dSample)){
    subsample <- horizontal2dSample[1:subsampleSize]
    gammaHatK <- computeGammaHat(sample = subsample, lag = lag)
    gammaHat0 <- computeGammaHat(sample = subsample, lag = 0)
    rhoHat <- computeRhoHat(gammaHat = gammaHatK, gammaHat0 = gammaHat0)
    rhoHatVec <- c(rhoHatVec, rhoHat)
  }

  trueRho <- createRhoScaledNoise(lag = lag)

  range = c(min(rhoHatVec, 0), max(rhoHatVec, 0))
  cat(min(rhoHatVec), max(rhoHatVec))

  # create filename
  fileName <- paste0("output/graphOfRhoHat, sampleSize=", sampleSize,
                     "tPar=", tPar, "lag=", lag, ".svg")

  # plot graph of rhoHat and theoretical
  svg(fileName)
  plot(x = rhoHatVec, type = "l", col = "red", xlab = "Index",
       ylab = "Value", ylim = range, main = "Graph of rho hat")
  abline(h = trueRho, lwd = 2)

  rhoHatLegend <- paste("rho hat with", lag, "lag")

  legend("topright", legend = c(rhoHatLegend, "theoretical rho"),
         col = c("red", "black"), lty=1, cex = 0.8)

  sampleSizeLegend <- paste("Sample size =", sampleSize)
  tParLegend <- paste("tPar =", tPar)

  legend("topleft", legend = c(sampleSizeLegend, tParLegend), cex = 0.8)

  dev.off()

  # plot line from horizontal sample
  fileName <- paste0("output/graphOfHorizLineForRho, sampleSize=", sampleSize,
                     "tPar=", tPar, "lag=", lag, ".svg")

  svg(fileName)

  plot(x = horizontal2dSample, type = "l", xlab = "Index", ylab = "Value",
       main = "Graph of horizontal sample line")

  legend("topleft", legend = c(sampleSizeLegend, tParLegend), cex = 0.8)

  dev.off()

  End <- Sys.time()
  duration <- End - Start

  cat("Duration =", duration, "\n")

  cat("End of test graphOfRhoHat", "\n")

  cat("=====================\n")
}
