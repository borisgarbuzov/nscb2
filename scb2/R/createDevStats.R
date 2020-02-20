#' @title createDevStats
#'
#' @name createDevStats
#'
#' @aliases createDevStats
#'
#' @description Creating statistics of the project.
#'
#' @return Returning a three-element list, where each sublist is statistics info:fileStats, categoryStats, generalStats.
#'
#' @examples
#' createDevStats()
#'
#' @export
#'
#' @importFrom R.utils countLines

createDevStats <- function() {
   filesList <- list.files(path = "../",
                          pattern = "*\\.R$",
                          all.files = F,
                          full.names = FALSE,
                          # include.dirs = F,
                          recursive = T,
                          ignore.case = FALSE,
                          include.dirs = F,
                          no.. = T)
   fileCount <- length(filesList)

   # 1. Full stats
   fileStats <- data.frame(matrix(0, nrow = fileCount, ncol = 4))
   colnames(fileStats) <- c("fileName", "location", "linesNumber", "category")

   fileStats$fileName <- basename(filesList)
   fileStats$location <- dirname(filesList)

   lineCount <- array(NA, dim = fileCount)

   for (fileIndex in seq_len(fileCount)) {
     filePath <- file.path(paste0("../", filesList[fileIndex]))
     currentLineCount <- R.utils::countLines(file = filePath)
     lineCount[fileIndex] <- currentLineCount[1]
     lineCount
   }

   fileStats$linesNumber <- lineCount

   fileStats[grep("R", fileStats$location), "category"] <- "core"
   fileStats[grep("testUtil", fileStats$fileName), "category"] <- "testUtil"
   fileStats[grep("lab", fileStats$location), "category"] <- "lab"
   # fileStats[grep("util", fileStats$location), "category"] <- "util"
   fileStats[grep("tests/testthat", fileStats$location), "category"] <- "testthat"
   fileStats[grep("tests/manualtest", fileStats$location), "category"] <- "manualtest"

   fileStats$fileName <- as.factor(fileStats$fileName)
   fileStats$location <- as.factor(fileStats$location)
   fileStats$linesNumber <- as.numeric(fileStats$linesNumber)
   fileStats$category <- as.factor(fileStats$category)

   # 2. Category stats
   categoryStats <- aggregate(fileStats$linesNumber,
                              by = list(category = fileStats$category),
                              FUN = sum)
   numberOfFiles <- aggregate(fileStats$linesNumber,
                              by = list(category = fileStats$category),
                              FUN = length)[ , 2]

   filesNamesList <- list()
   catLevels <- levels(fileStats$category)
   lengthCatLevels <- length(levels(fileStats$category))

   for (i in seq_len(lengthCatLevels)) {
     catName <- catLevels[i]
     filesNamesListI <- unlist(fileStats[fileStats$category == catName, ]$fileName)
     filesNamesList[i] <- paste(filesNamesListI, collapse=", ", sep = "\n")
     filesNamesList
   }

   filesNamesList <- unlist(filesNamesList)

   categoryStats <- cbind(categoryStats, numberOfFiles, filesNamesList)
   names(categoryStats) <- c("category", "lineCount", "filesCount", "fileNamesByCategory")

   # 3. General stats
   generalStats <- list()
   generalStats$categoryCount <- length(levels(fileStats$category))
   generalStats$totalLineCount <- sum(fileStats$linesNumber)
   generalStats$totalFileCount <- fileCount
   generalStats <- as.data.frame(generalStats)

   # gathering all the three to a single list of DF
   statsList <- list()
   # give them names
   statsList$fileStats <- fileStats
   statsList$categoryStats <- categoryStats
   statsList$generalStats <- generalStats

   statsList
}
