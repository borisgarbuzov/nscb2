testUtilWuForNonCentWithXXExpansion <- function(sizeArray,
                                            sd,
                                            mu,
                                            numberOfExperiment)
{
  cat("\nTesting \'tests_107_wuForNonCentWithXXExpansion\' \n")

  cat("Test parameters:", "\n")
  cat("size =", sizeArray, "\n")
  cat("sd =", sd, "\n")
  cat("mu =", mu, "\n")
  cat("numberOfExperiment =", numberOfExperiment, "\n")

  fileName <- "wuForNonCentWithXXExpansion"
  fileName <- timestampGenerator(fileName = fileName)

  subtitle <- paste("\nmu = ",mu,", sd = ",sd)
  lrvRecursiveShatteredHatArray <- matrix(data = NA,nrow = length(sizeArray),ncol = numberOfExperiment)
  originalMatrix <- matrix(data = NA,nrow = max(sizeArray),ncol = numberOfExperiment)
  for (columnIndex in 1:numberOfExperiment)
  {
    originalMatrix[,columnIndex]<-createOriginalXX(size = max(sizeArray),
                                                   mu = mu,
                                                   sd = sd)
  }
  legendNames <- paste0("OriginalFirst = ",round(originalMatrix[1,], digits = 3))
  for(indexSize in 1:length(sizeArray))
  {
    size <- sizeArray[indexSize]
    for(columnIndex in 1:numberOfExperiment)
    {
      original <- originalMatrix[1:size,columnIndex]
      lrvRecursiveShatteredHatArray[indexSize,columnIndex] <- estimateLRVWu2009ForNonCenteredSample(sample = original)
    }



    saveJpg(fileName = fileName,path = "./plots")

    matplot(x=sizeArray,y=lrvRecursiveShatteredHatArray,type = "l")
    legend("topleft",legend = legendNames,col = seq_len(numberOfExperiment),fill = seq_len(numberOfExperiment))
    title("Wu2009 For NonCentered sample with Original XX Expansion",sub = subtitle)
    graphics.off()
  }
  cat("\n End of wuForNonCentWithXXExpansion\n")

  cat("=====================\n")
}
