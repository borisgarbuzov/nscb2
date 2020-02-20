#'@export
testUtilComputeAllCorHats <- function(tParArray,
                                      lagCount,
                                      sample,
                                      bandwidth)
{

  mySampleSize=length(sample)

  tParCount <- length(tParArray)
  allCorHats <- array(0, dim = c(tParCount, lagCount + 1))
  for (lagIndex in 0:lagCount) {
    for (tParIndex in seq_len(tParCount)) {
      tParPoint = tParArray[tParIndex]
      allCorHats[tParIndex, lagIndex + 1] <- testUtilComputeCorHat(tParArray = tParPoint,
                                                                  lag = lagIndex,
                                                                  sample = sample,
                                                                  bandwidth = bandwidth)
    }
  }

  allCorHats
  # computeAllCorHats returns one-dimensional array, whereas it should return two-dimensional
}
