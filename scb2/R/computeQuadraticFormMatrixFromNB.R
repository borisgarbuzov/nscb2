#' @title computeQuadraticFormMatrixFromNB
#'
#' @name computeQuadraticFormMatrixFromNB
#'
#' @aliases computeQuadraticFormMatrixFromNB
#'
#' @description Create \code{b}, a.k.a. bandwidth given \code{n} as being a sample size
#'
#' @param size the sample size
#' @param batchSize the batchSize
#'
#' @return A scalar value of \code{b}.
#'
#' @examples bandwidthValue <- computeB(n = 8)
#'
#' @export

computeQuadraticFormMatrixFromNB <- function(size,batchSize)
{
  if((size%%batchSize)!=0)
  {
    stop("size:",size," batchSize: ", batchSize,"\n batchSize is not compatible with this size")
  }
  batchCount <- size/batchSize

  quadraticFormMatrix <- matrix(data=- 1 / (batchCount * (size-batchSize)), nrow=size,ncol=size)
  for (index in 1:size)
  {
    lastCol <- ceiling(index/batchSize)*batchSize
    firstCol <- lastCol-batchSize+1
    quadraticFormMatrix[index,firstCol:lastCol]<-1/size
  }
  return(quadraticFormMatrix)
}
