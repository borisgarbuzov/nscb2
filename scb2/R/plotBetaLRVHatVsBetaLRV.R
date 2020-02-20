plotBetaLRVHatVsBetaLRV <- function()
{
  if (!dir.exists("output/")) {
    dir.create("output", recursive = T)
  }

  pathFile <- file.path(system.file("data", package = "scb2"),
                        "betLRV2dArray.csv")
  betaLRVHat2dArray <- read.csv(file = pathFile, header = T)

  tParCount <- length(betaLRVHat2dArray[,1])
  tParArray <- createTParArray(tParCount = tParCount)

  betaLrv <- array(data = NA, dim = length(tParArray))
  for (tIndex in 1:length(tParArray)) {
    betaLrv[tIndex] <- computeTrueBetaLrvMA1(tPar = tParArray[tIndex])
  }

  svg(filename = "output/betaLRVmatplot.svg")

  matplot(x = tParArray, y = betaLRVHat2dArray, type = "l",
          main = "beta LRV hat 1000 - 11000 sample size", xlab = "tPar",
          ylab = "value")
  lines(x = tParArray, y = betaLrv, type = "l", lwd = "3", col = "steelblue")

  legend("topleft", legend = c(colnames(betaLRVHat2dArray), "true Beta LRV"),
         col = c(seq_len(tParCount), "steelblue"), cex = 0.8,
         lty = c(seq_len(tParCount), 1))

  dev.off()
}
