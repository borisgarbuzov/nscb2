#' @export
#'
#' @importFrom microbenchmark microbenchmark
testUtilBenchmarkCreateBetaArray <- function(sizeArray,
                                           psi,
                                           sigma,
                                           mean,
                                           maxLag)
{
  cat("\nTesting \'tests_86_testUtilBenchmarkCreateBetaArray\' \n")
  cat("Test parameters:", "\n")
  cat("sizeArray =", sizeArray, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

  sumResArray <- matrix(nrow = 0,ncol = 8)
  fileName <- "BenchmarkCreateBetaArray"
  fileName <- timestampGenerator(fileName = fileName)
  for(index in 1:length(sizeArray))
  {
    original <- createOriginalMA1(size = sizeArray[index],
                                  psi = psi,
                                  sigma = sigma,
                                  mean = mean)
    res <- microbenchmark(createBetaMatrix(sample = original,
                                          psi = psi,
                                          sigma = sigma,
                                          maxLag=maxLag),
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
      subtitle <- paste0("Max time = ", h,":",minute,":",second,
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
    saveJpg(fileName,path = "./plots/")
    par(mfrow=c(2,1))
    plot(sumResArray$median~sizeArray[1:dim(sumResArray)[1]],ylab = "Time",type = "l",col="blue")
    title(main = "Median time Create BetaArray ",sub = subtitle)
    plot(sumResArray$max~sizeArray[1:dim(sumResArray)[1]],type = "l",col = "red",
         ylab = "Time",ylim=c(yMin-yMin5,yMax+yMax5))
    lines(sumResArray$min~sizeArray[1:dim(sumResArray)[1]],col="green")
    title(main = "Create Beta Array Maximum and minimum time",sub = subtitle)
    graphics.off()
  }
  cat("End of test BenchmarkCreateBetaArray","\n")

  cat("=====================\n")
}
