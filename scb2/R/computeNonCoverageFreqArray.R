#' @title computeNonCoverageFreqDist
#'
#' @name computeNonCoverageProbDist
#'
#' @aliases
#'
#' @description in a cycle for each alpha in array call NonCoverageFreqArray
#'
#'
#' @param superReplicationCount superReplicationCount
#' @param replicationCount a replication count.
#' @param sampleSize a sample size.
#' @param lag a lag value, true lag is lag - 1.
#' @param tParArray a T parameter array
#' @param nonCoverageProbability probability of non-coverage.
#' @param fileName fileName = ""

#'
#'
#' @return array of alpha hat
#'
#' @examples
#'
#' @export

computeNonCoverageFreqArray  <- function(superReplicationCount,
                                        replicationCount,
                                        sampleSize,
                                        lag,
                                        tParArray,
                                        nonCoverageProbability,
                                        fileName = "") {

  bandwidth = computeB(sampleSize = sampleSize)
  alphaHatArray <- array(0, dim = superReplicationCount)

  lagCount <- computeLagCount(sampleSize = sampleSize,
                              lag = lag)

  corArray <- computeCor(lag = lag,
                         tParArray = tParArray)

  for (superIndex in 1:superReplicationCount) {

    cat("\n Now super index =", superIndex)

    alphaHatArray[superIndex] <- computeNonCoverageFreq(replicationCount=replicationCount,
                                                        sampleSize = sampleSize,
                                                        lag = lag,
                                                        tParArray = tParArray,
                                                        corArray = corArray,
                                                        lagCount = lagCount,
                                                        nonCoverageProbability = nonCoverageProbability,
                                                        superReplicationCount = superReplicationCount,
                                                        fileName = fileName)
  }
  saveNonCoverageFreqArray(nonCoverageProbability = nonCoverageProbability,
                            alphaHatArray = alphaHatArray,
                            sampleSize = sampleSize,
                            bandwidth = bandwidth,
                            replicationCount = replicationCount,
                            lag = lag,
                            superReplicationCount = superReplicationCount,
                            fileName = fileName)
  alphaHatArray
}

