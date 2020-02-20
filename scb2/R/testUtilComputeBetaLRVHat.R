#'@export
testUtilComputeBetaLRVHat  <- function(tParArray,
                                       lag,
                                       sample,
                                       bandwidth,
                                       allCorHats) {

  mySampleSize=length(sample)
  tParCount = length(tParArray)
  sampleSize = length(sample)
  termCount = computeTermCount(sampleSize = sampleSize) # aka L

  term=0
  betaLRVHat = array(0, dim = tParCount)
  for (tParIndex in 1 : tParCount)
  {
    for (termIndex in 1 : (termCount))
    {

      term = (2 * allCorHats[tParIndex, lag+1] * allCorHats[tParIndex, termIndex+1] -
                allCorHats[tParIndex, abs(lag - termIndex)+1] -
                allCorHats[tParIndex, lag + termIndex+1]) ^ 2
      betaLRVHat[tParIndex] = betaLRVHat[tParIndex] + term

    }
  }

  betaLRVHat
}
