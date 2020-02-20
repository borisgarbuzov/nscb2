#' @title createDevStatsBrief
#'
#' @name createDevStatsBrief
#'
#' @aliases createDevStatsBrief
#'
#' @description Creating brief statistics of the project. Implemented as a wrapper to createDevStats(), eliminating all the detailed stuff away.
#'
#' @return Returning a two-element list, where each sublist is statistics info:fileStats, categoryStats, generalStats.
#'
#' @examples
#' createDevStatsBrief()
#'
#' @export
#'
#' @importFrom R.utils countLines

createDevStatsBrief <- function() {
  statsList <- createDevStats()
  statsListCategory <- data.frame(category = statsList$categoryStats$category,
                                  lineCount = statsList$categoryStats$lineCount,
                                  filesCount = statsList$categoryStats$filesCount
                                  )
  statsListBrief <- list(categoryStats = statsListCategory,
                         generalStats = statsList$generalStats)
  statsListBrief
}
