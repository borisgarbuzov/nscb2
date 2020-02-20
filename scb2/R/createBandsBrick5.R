createBandsBrick5 <- function(replicationCount,
                              tParCount,
                              lag,
                              nonCoverageProbability,
                              parList) {
  # create 3 dimensional array for band brick
  bandsArray <- array(data = NA, dim = c(replicationCount, tParCount, 2))

  # go through replication count and for each compute bands
  for (repIndex in seq(replicationCount)) {
    bandsArray[repIndex, , ] <-
      computeBand5(sampleSize = parList$sampleSize,
                   testSample = parList$testSample,
                   tParCount = tParCount,
                   lag = lag,
                   sigma = parList$sigma,
                   mean = parList$mean,
                   noise = parList$noise,
                   nonCoverageProbability = nonCoverageProbability,
                   type = parList$type,
                   diagOrHoriz = parList$diagOrHoriz,
                   typeOfKernel = "gaussian",
                   parList = parList)

    cat("bands left in bandsBrick", replicationCount - repIndex, "\n")
  }
  return(bandsArray)
}
