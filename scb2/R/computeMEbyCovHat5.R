"Функция вычисляет margin of error для данных параметров"
computeMEbyCovHat5 <- function(tParArray,
                               lag,
                               sample,
                               nonCoverageProbability,
                               diagOrHoriz,
                               typeOfKernel,
                               parList){

  if (diagOrHoriz == "horiz") {
    sampleSize <- length(sample[1, ])
  } else {
    sampleSize <- length(sample)
  }

  # if parameter isTrueLRV equals True than we compute true Beta LRV
  if (parList$isTrueLRV == T) {
    betaLrv <- array(data = NA, dim = length(tParArray))
    for (tIndex in 1:length(tParArray)) {
      betaLrv[tIndex] <- computeTrueBetaLrvMA1(tPar = tParArray[tIndex])
    }
  }

  # if parameter isTrueLRV equals False we compute beta LRV hat
  if (parList$isTrueLRV == F) {
    betaLrv <- computeBetaLrvHat5(sample = sample,
                                     lag = lag,
                                     tParArray = tParArray,
                                     diagOrHoriz = diagOrHoriz,
                                     typeOfKernel = typeOfKernel)
  }

  # if factorType equals 'NRF' compute non-random factor
  if (parList$factorType == "NRF") {
    # "bandWidth cov, который будет нужен для дальнейших вычислений"
    bCov <- computeBCovForME5(sampleSize = sampleSize)

    # "Основная формула разбита на три части"
    logSqrt <-  sqrt(-2 * log(bCov))
    cFactor <- logSqrt + (getC_K(type = "normal") - log(log(1 / sqrt (1 - nonCoverageProbability)))) / logSqrt
    phiFactor <- sqrt(getPHI_K(type = "normal") / (sampleSize * bCov))
    factor <- cFactor * phiFactor
  }

  # if factorType equals 'bootstrap' compute 'Zhou' or bootstrap factor
  if (parList$factorType == "bootstrap") {
    zhouStatisticArray <- generateZhouStatisticArray(sampleSize = sampleSize,
                                                     tParCount = 10,
                                                     replicationCount = 10)
    factor = quantile(x = zhouStatisticArray, probs = 1-nonCoverageProbability)
  }

  # if factorType equals 'tabulated mod error' take tabulated mod error
  if (parList$factorType == "tabulated mod error") {
    factor <- getTabulatedQuantile(sampleSize = sampleSize,
                                   nonCoverageProbability = nonCoverageProbability)
  }

  meByCovHat <- factor * sqrt(betaLrv)

  return(meByCovHat)
}
