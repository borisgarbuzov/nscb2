# Important note
# minimal sample size should be more than 100
# minimal lenghth should be more then 3 elements

zeroArraySidesByBandwidth <- function(myArray,
                                      sampleSize)
{
  # take length of given array and this will be our tParCount
  tParCount <- length(myArray)
  tParArray <- createTParArray(tParCount = tParCount)

  # compute b
  bCovStart <- computeBCov5(sampleSize = sampleSize)
  bCovEnd <- 1 - bCovStart

  # logical array to get values less or more than our bandwidth
  isNotZeroArray <- tParArray >= bCovStart & tParArray <= bCovEnd

  startIndex <- head(which(isNotZeroArray == T), n = 1)
  endIndex <- tail(which(isNotZeroArray == T), n = 1)

  for (myIndex in seq(myArray)) {
    if (myIndex < startIndex || myIndex > endIndex) {
      myArray[myIndex] <- 0
    }
  }

  return(myArray)
}
