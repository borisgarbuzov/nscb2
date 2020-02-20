#' @title convertToSymMatrix
#'
#' @name convertToSymMatrix
#'
#' @aliases convertToSymMatrix
#'
#' @description Create \code{b}, a.k.a. bandwidth given \code{n} as being a sample size
#'
#' @param originalMatrix the originalMatrix
#'
#' @return A scalar value of \code{b}.
#'
#' @examples bandwidthValue <- computeB(n = 8)
#'
#' @export

# symmetrization could be done just by averaging in 1 line
# but we do it through quadratic form
convertToSymMatrix <- function(originalMatrix)
{
  argumentVector <- array(data = 0,dim = dim(originalMatrix)[1])
  symMatrix<-matrix(data = NA,length(argumentVector),length(argumentVector))
  diagonal <- 1
  for (columnIndex in 1:length(argumentVector))
  {
    for(rowIndex in diagonal:length(argumentVector))
    {
      if(columnIndex==rowIndex)
      {
        vectorOfXrowAndColumn <- argumentVector
        vectorOfXrowAndColumn[columnIndex] <- 1
        symMatrix[rowIndex,columnIndex] <-computeQuadraticFormValue(vectorOfXrowAndColumn,matrix = originalMatrix)
      }else
      {

          vectorOfXrowAndColumn <- argumentVector
          vectorOfXrowAndColumn[columnIndex] <- 1
          vectorOfXrowAndColumn[rowIndex] <- 1
          vectorOfXColumn <- argumentVector
          vectorOfXColumn[columnIndex] <- 1
          vectorOfXRow <- argumentVector
          vectorOfXRow[rowIndex] <- 1
          symOfXRowAndColumn <- computeQuadraticFormValue(argumentVector = vectorOfXrowAndColumn,matrix = originalMatrix)
          symOfXRow <- computeQuadraticFormValue(argumentVector = vectorOfXColumn,matrix = originalMatrix)
          symOfXColumn <- computeQuadraticFormValue(argumentVector = vectorOfXRow,matrix = originalMatrix)
          symMatrix[rowIndex,columnIndex] <- (symOfXRowAndColumn - symOfXColumn - symOfXRow)/2

      }
    }
    diagonal <- 1 + diagonal
  }
  diagonal <- 2
  for(columnIndex in 1:(length(argumentVector)-1))
  {

    for(rowIndex in diagonal:length(argumentVector))
    {
      symMatrix[columnIndex,rowIndex] <- symMatrix[rowIndex,columnIndex]
    }
    diagonal <- diagonal + 1
  }

  symMatrix

}


