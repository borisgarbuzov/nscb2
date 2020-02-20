computeIsCoveredArray5 <- function(bandsBrick,
                                   tParArray,
                                   replicationCount,
                                   parList) {
  # create empty array with size of replicationCount
  isCoveredArray <- array(data = NA, dim = replicationCount)

  # go through replicationCount and each time call function computeIsCovered
  # for every band in bandsBrick
  for (repIndex in seq(replicationCount)) {
    parList["repIndex"] <- repIndex

    band <- bandsBrick[repIndex, ,]
    isCoveredArray[repIndex] <- computeIsCovered5(band = band,
                                                  tParArray = tParArray,
                                                  parList = parList)

    cat("replication count left", replicationCount - repIndex, "\n")
  }

  return(isCoveredArray)
}
