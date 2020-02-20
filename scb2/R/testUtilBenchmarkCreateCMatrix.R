#' @export
#'
#' @importFrom microbenchmark microbenchmark
testUtilBenchmarkCreateCMatrix <- function(sizeArray,
                                              psi,
                                              sigma,
                                              mean)
{
  cat("\nTesting \'tests_84_testUtilBenchmarkCreateCMatrix\' \n")

  cat("Test parameters:", "\n")
  cat("sizeArray =", sizeArray, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

  sumResArray <- matrix(,nrow = 0,ncol = 8)

  fileName.median <- "BenchmarkCreateCMatrixMedian"
  fileName.median <- timestampGenerator(fileName = fileName.median)
  fileName.maxMin <- "BenchmarkCreateCMatrixMaxMin"
  fileName.maxMin <- timestampGenerator(fileName = fileName.maxMin)
  for(index in 1:length(sizeArray))
  {
    res <- microbenchmark(createCMatrix(size = sizeArray[index],
                                        psi = psi,
                                        sigma = sigma),
                          times = 1000L)
    sumResArray <-rbind(sumResArray, summary(res,unit = "s"))
    yMax <- max(sumResArray$max)
    yMin <- min(sumResArray$min)
    yMax5 <- yMax *0.05
    yMin5 <- yMin * 0.05
    if(yMax >= 3600)
    {
      hour <- floor(yMax / 3600)
      minute <- floor(yMax %% 3600 / 60)
      second <- floor(yMax %% 3600 %% 60)
      subtitle <- paste0("Max time = ", hour,":",minute,":",second,
                         "  when size = ",sizeArray[which.max(sumResArray$max)])
    }else if(yMax >= 60)
    {
      minute <- floor(yMax %% 3600 / 60)
      second <- floor(yMax %% 3600 %% 60)
      subtitle <- paste0("Max time = ",minute,":",second,
                         "  when size = ",sizeArray[which.max(sumResArray$max)])
    }else
    {
      subtitle <- paste0("Max time = ", round(yMax,digits = 4),
                         " seconds  when size = ",sizeArray[which.max(sumResArray$max)])
    }
    saveJpg(fileName.median,path = "./plots/")
    plot(sumResArray$median~sizeArray[1:dim(sumResArray)[1]],ylab = "Time",type = "l",col="blue")
    title(main = "Median time Create CMatrix ",sub = subtitle)
    graphics.off()
    saveJpg(fileName.maxMin,path = "./plots/")
    plot(sumResArray$max~sizeArray[1:dim(sumResArray)[1]],type = "l",col = "red",
         ylab = "Time",ylim=c(yMin-yMin5,yMax+yMax5))
    lines(sumResArray$min~sizeArray[1:dim(sumResArray)[1]],col="green")
    title(main = "CreateCMatrix Maximum and minimum time",sub = subtitle)
    graphics.off()
  }

  cat("End of test BenchmarkCreateCMatrix","\n")

  cat("=====================\n")

}
