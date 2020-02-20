#' @title computeTermCount
#'
#' @name computeTermCount
#'
#' @aliases computeTermCount
#'
#' @description computeTermCount
#'
#' @param sampleSize sampleSize
#'
#' @return termCount
#'
#' @examples
#'
#' @export
computeTermCount=function(sampleSize)
{

  return (floor (2 * sampleSize^(4/15)))
}
