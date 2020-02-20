testUtilBenchmarkBetaLRVAndBetaLRVHat <- function(sizeArray,
                                                  mean,
                                                  sigma,
                                                  psi,
                                                  lag,
                                                  cutOffValue,
                                                  type,
                                                  times)
{
  cat("\n Testing \'tests_scb2_137_BenchmarkBetaLRVAndBetaLRVHat\ \n")
  cat("\nTest parameters :","\n")
  cat("sizeArray= ");print(sizeArray);cat("\n")
  cat("mean= ",mean,"\n")
  cat("sigma= ",sigma,"\n")
  cat("psi= ",psi,"\n")
  cat("times = ",times,"\n")
  cat("lag= ",lag,"\n")
  cat("cutOffValue= ",cutOffValue,"\n")
  cat("type= ",type,"\n")

  sumResArray <- matrix(nrow = 0,ncol = 8)
  beginTime <- Sys.time()
  duration <- microbenchmark(
  for(index in 1:length(sizeArray))
  {

    res <- microbenchmark(testUtilBetaLRVAndBetaLRVHat(size = sizeArray[index],
                                                       mean = mean,
                                                       sigma = sigma,
                                                       psi = psi,
                                                       cutOffValue = cutOffValue,
                                                       type = "OB"),times = times)
    sumResArray <-rbind(sumResArray, summary(res,unit = "s"))

  },times = 1L)
  endTime <- Sys.time()
  duration <- summary(duration,unit = "s")
  duration <- duration$median
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
                       "  when size = ",sizeArray[which.max(sumResArray$max)],"\n",
                       "numbder of points = ",length(sizeArray),
                       ", step between the sizes = ", sizeArray[2]-sizeArray[1],"\n",
                       durationTime(duration))
  }else if(yMax >= 60)
  {
    minute <- floor(yMax %% 3600 / 60)
    second <- floor(yMax %% 3600 %% 60)
    subtitle <- paste0("Max time = ",minute,":",second,
                       "  when size = ",sizeArray[which.max(sumResArray$max)],"\n",
                       "numbder of points = ",length(sizeArray),
                       ", step between the sizes = ", sizeArray[2]-sizeArray[1],"\n",
                       durationTime(duration))
  }else
  {
    subtitle <- paste0("Max time = ", round(yMax,digits = 4),
                       " seconds  when size = ",sizeArray[which.max(sumResArray$max)],"\n",
                       "numbder of points = ",length(sizeArray),
                       ", step between the sizes = ", sizeArray[2]-sizeArray[1],"\n",
                       durationTime(duration))
  }
  fileName.median <- "BenchmarkBetaLRVAndBetaLRVHatMedianTime"
  fileName.median <- timestampGenerator(fileName = fileName.median)

  saveJpg(fileName.median,path = "./plots/")
  plot(sumResArray$median~sizeArray,ylab = "Time",xlab = "",col="blue")
  title(main = " time of OBM LRVHat(beta) vs sample size,\n batchSize = sqrt(sampleSize),\n each point corresponds to new sample",sub = subtitle)
  graphics.off()

  cat(" End of test BenchmarkBetaLRVAndBetaLRVHat ","\n")
}
