#' @title computeLRVofOB2dArray
#'
#' @name computeLRVofOB2dArray
#'
#' @aliases computeLRVofOB2dArray
#'
#' @description Create \code{b}, a.k.a. bandwidth given \code{n} as being a sample size
#'
#' @param original original
#' @param batchSize batchSize
#'
#' @return A scalar value of \code{b}.
#'
#' @examples bandwidthValue <- computeB(n = 8)
#'
#' @export

computeLRVofOB2dArray <- function(original,batchSize)
{
  matrixOB <- cutOB(original = original,
                    batchSize = batchSize)
  size <- length(original)
  batchCount <- size - batchSize +1


  originalMean <- mean(original)
  rowMeanVector <- rowMeans(matrixOB)
  rowMeanCenteredVector <- rowMeanVector - originalMean
  sumOfCenteredSquares <- sum(rowMeanCenteredVector^2)
  # uncommented. This was right
  lrvOBFactor = size * batchSize / (batchCount * (batchCount - 1))
  lrvHatFromOB <- lrvOBFactor*sumOfCenteredSquares
  # was wrong
  # where did we take this factor formula before?
  # lrvOBFactor = size * batchSize / (batchCount * (batchCount - 1))
  # lrvHatFromOB <- lrvOBFactor*sumOfCenteredSquares

  # Change this factor to the one from Song 93.
  # 2.2 batch means estimators
  # Formula of denominator d.

  #denominator = batchCount * (size / batchSize - 1)
  #lrvHatFromOB <- sumOfCenteredSquares / denominator
  return(lrvHatFromOB)
}
