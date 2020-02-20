#' @title computeQuadraticFormMatrixFromOB
#'
#' @name computeQuadraticFormMatrixFromOB
#'
#' @aliases computeQuadraticFormMatrixFromOB
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

computeQuadraticFormMatrixFromOB <- function(size,batchSize)
{
  batchCount <- size - batchSize + 1
  # the following matrix participates in creation of numerator
  aMatrix <- matrix(data = 0,nrow = size,ncol = size)

  for (colIndex in 1:size)
  {
    for (rowIndex in 1:size)
    {
      term1 = batchCount
      term2 = max(0, batchSize - abs(rowIndex - colIndex))
      term3 = min(rowIndex, colIndex)
      term4 = size - max(rowIndex, colIndex) + 1

      aMatrix[rowIndex,colIndex] <-
        min (term1, term2, term3, term4)

        # min(batchSize,
        # max(0,batchCount-abs(rowIndex-colIndex)),
        # min(rowIndex, colIndex),
        # (size - max(rowIndex, colIndex)+1))


    }

  }

  #cat ("\n aMatrix: \n")
  #print (aMatrix)
  #cat ("\n end of aMatrix: \n")

  # this is the denominator from Song 93
  denominator <- batchCount*(size/batchSize-1)
  # but they estimate the different parameter
  # this was the reason of broken picture
  # we estimate the different parameter.
  denominator = denominator / size

  numerator <- matrix(data = 19, nrow = size,ncol = size)

  for (colIndex in 1:size)
  {
    for (rowIndex in 1:size)
    {
      #cat ("\n rowIndex =", rowIndex, "colIndex =", colIndex, "\n")
      term1 = aMatrix[rowIndex,colIndex]/(batchSize^2)
      term2 = - (aMatrix[rowIndex,rowIndex] +
                 aMatrix[colIndex,colIndex])/(size*batchSize)
      term3 = (size - batchSize + 1)/(size^2)
      #cat ("\n term1 =", term1, "term2 =", term2, "term3 =", term3, "\n")

      numerator[rowIndex,colIndex] = term1 + term2 + term3
      #cat ("\n numerator =", numerator, "\n")


      #   aMatrix[rowIndex,colIndex]/(batchSize^2) -
      #   (aMatrix[rowIndex,rowIndex] +
      #      aMatrix[colIndex,colIndex])/(size*batchSize)
      # + (size - batchSize + 1)/(size^2)
    }
  }

  #cat ("\n numerator: \n")
  #print (numerator)
  #cat ("\n end of numerator: \n")

  #cat ("\n denominator: \n")
  #cat (denominator)
  #cat ("\n end of denominator: \n")

  quadraticFormMatrix <- numerator/denominator
  #cat ("\n quadraticFormMatrix: \n")
  #print (quadraticFormMatrix)
  #cat ("\n end of quadraticFormMatrix: \n")


  return (quadraticFormMatrix)


}
