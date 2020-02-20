testUtilWuForCenteredWithXminusX <- function(sizeArray,
                                             sd,
                                             mu,
                                             numberOfExperiment)
{
  cat("\nTesting \'tests_101_wuForCenteredWithXminusX\' \n")

  cat("Test parameters:", "\n")
  cat("size =", sizeArray, "\n")
  cat("sd =", sd, "\n")
  cat("mu =", mu, "\n")
  cat("numberOfExperiment =", numberOfExperiment, "\n")

  fileName <- "wuForCentWithXminusX"
  fileName <- timestampGenerator(fileName = fileName)

  subtitle <- paste("\nmu = ",mu,", sd = ",sd)
  lrvRecursiveShatteredHatArray <- matrix(data = NA,nrow = length(sizeArray),ncol = numberOfExperiment)

  for(indexSize in 1:length(sizeArray))
  {
    size <- sizeArray[indexSize]
    for(columnIndex in 1:numberOfExperiment)
    {
      original <- createOriginalXminusX(size = size,
                                        mu = mu,
                                        sd = sd)
      lrvRecursiveShatteredHatArray[indexSize,columnIndex] <- estimateLRVWu2009ForCenteredSample(sample = original)
    }



    saveJpg(fileName = fileName,path = "./plots")

    matplot(x=sizeArray,y=lrvRecursiveShatteredHatArray,type = "l")
    title("Wu2009 For Centered sample with Original XminusX \nRenewal",sub = subtitle)
    graphics.off()
  }
  cat("\n End of wuForCenteredWithXminusX\n")

  cat("=====================\n")
}
