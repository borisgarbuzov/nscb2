#' @title computeSqareRootBatchSizeUpperBound
#'
#' @name computeSqareRootBatchSizeUpperBound
#'
#' @aliases computeSqareRootBatchSizeUpperBound
#'
#' @description Create \code{b}, a.k.a. bandwidth given \code{n} as being a sample size
#'
#' @param sigma the sigma
#' @param sampleSize the sampleSize
#'
#' @return A scalar value of \code{b}.
#'
#' @examples bandwidthValue <- computeB(n = 8)
#'
#' @export

computeSqareRootBatchSizeUpperBound <- function(indexArray,
                                                sigma,
                                                type)
{
  batchSize <- ceiling(sqrt(indexArray[length(indexArray)]))
  upperBound <- computeUpperBound(indexArray = indexArray,
                                  sigma = sigma,
                                  type = type,
                                  batchSize = batchSize)
  return(upperBound)

}
