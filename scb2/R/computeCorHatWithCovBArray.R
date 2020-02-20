computeCorHatWithCovBArray <- function(tParArray,
                                       sample,
                                       lag,
                                       diagOrHoriz) {

  if (diagOrHoriz == "horiz") {
    horiz <- sample
    sampleSize <- length(horiz[1, ])
  } else {
    sampleSize <- length(sample)
  }

  # get bandWidth for b cov
  bCov <- computeBCov5(sampleSize = sampleSize)

  # create empty array for corHat
  corHatArray <- array(data = NA, dim = length(tParArray))

  # go through tParArray and compute corHat
  for (tIndex in seq(tParArray)) {
    if (diagOrHoriz == "horiz") {
      sample <- horiz[tIndex,]
    }

    corHatArray[tIndex] <- computeCorHatWithCovB(
      tPar = tParArray[tIndex],
      sample = sample,
      lag = lag,
      bCov = bCov
    )
  }

  return(corHatArray)
}
