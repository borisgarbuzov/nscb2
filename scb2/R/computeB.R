#' @title computeB
#'
#' @name computeB
#'
#' @aliases createB
#'
#' @description Create \code{b}, a.k.a. bandwidth given \code{n} as being a sample size
#'
#' @param sampleSize the sample size
#'
#' @return A scalar value of \code{b}.
#'
#' @examples bandwidthValue <- computeB(n = 8)
#'
#' @export


computeB <- function (sampleSize, bDegree = -0.26, bConst = 1)
{
  #scaleConstant = getScaleConstant()
  if(bConst != 1){
    warning("The value of the multiplicative constant B must be 1 for stable work")
  }
  scaleConstant = bConst
  degree = getDegree(bDegree)
  # degree should be between -1/2=-0.5 and -1/9=-0.11
  # if it undercovers or alpha hat is too big, it means ME is too small
  # If ME is too small, so bandwidth is too big
  # To make it smaller, we can decrease scale constant from 1 to 0.5 and on
  # or we can decrease the degree, or farther away from -0.11 and closer to -0.5
  # It was -0.2 before. Now we try -0.4
  # The scaleConstant was =1, now we change it to 0.5
  b <- scaleConstant * sampleSize ^ degree
  #if(b>=0.5)
  #{
  #  warning("bandwith too large. Alpha be equal to 0")
  #}
  return(b)
}
