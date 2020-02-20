csvExport <- function(infoArray, fileNameCSV, graph = F, rowNames = F){
  # plot time graphic
  if (graph){
    timeGraph(infoArray, fileNameCSV)
  }
  # create file where store csv file
  csvFileName <- paste0(fileNameCSV, ".csv")

  # write data to csv file
  write.csv(infoArray, csvFileName, row.names=rowNames)
}
