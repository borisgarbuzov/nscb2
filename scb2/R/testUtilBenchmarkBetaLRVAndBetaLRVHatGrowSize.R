testUtilBenchmarkBetaLRVAndBetaLRVHatGrowSize <- function(maxSizeSeq,
                                                          sizeIncrement,
                                                          mean,
                                                          sigma,
                                                          psi,
                                                          lag,
                                                          cutOffValue,
                                                          type,
                                                          times)
{
  cat("\n Testing \'tests_scb2_136_BenchmarkBetaLRVAndBetaLRVHatGrowSize\ \n")
  cat("\nTest parameters :","\n")
  cat("maxSize= ");print(maxSizeSeq);cat("\n")
  cat("sizeIncrement= ",sizeIncrement,"\n")
  cat("mean= ",mean,"\n")
  cat("sigma= ",sigma,"\n")
  cat("psi= ",psi,"\n")
  cat("times = ",times,"\n")

  sumResArray <- matrix(nrow = 0,ncol = 8)
  beginTime <- Sys.time()
  for(index in 1:length(maxSizeSeq))
  {

    res <- microbenchmark(testUtilBetaLRVAndBetaLRVHatGrowSize(maxSize = maxSizeSeq[index],
                                                               sizeIncrement = sizeIncrement,
                                                               mean = mean,
                                                               psi = psi,
                                                               sigma = sigma,
                                                               lag = lag,
                                                               cutOffValue = cutOffValue,
                                                               type = "OB"),times = times)
    sumResArray <-rbind(sumResArray, summary(res,unit = "s"))

  }

  endTime <- Sys.time()
  duration <- endTime - beginTime

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
                       "  when size = ",maxSizeSeq[which.max(sumResArray$max)],"\n",
                       "MaxLag = ",lag,", duration = ",round(duration,3))
  }else if(yMax >= 60)
  {
    minute <- floor(yMax %% 3600 / 60)
    second <- floor(yMax %% 3600 %% 60)
    subtitle <- paste0("Max time = ",minute,":",second,
                       "  when size = ",maxSizeSeq[which.max(sumResArray$max)],"\n",
                       "MaxLag = ", lag, ", duration = ",round(duration,3))
  }else
  {
    subtitle <- paste0("Max time = ", round(yMax,digits = 4),
                       " seconds  when size = ",maxSizeSeq[which.max(sumResArray$max)],"\n",
                       "MaxLag = ", lag, ", duration = ",round(duration,3))
  }
  fileName.median <- "BenchmarkBetaLRVAndBetaLRVHatGrowSizeMedianTime"
  fileName.median <- timestampGenerator(fileName = fileName.median)
  fileName.maxMin <- "BenchmarkBetaLRVAndBetaLRVHatGrowSizeMaxMinTime"
  fileName.maxMin <- timestampGenerator(fileName = fileName.maxMin)
  saveJpg(fileName.median,path = "./plots/")
  plot(sumResArray$median~maxSizeSeq,ylab = "Time",xlab = "",type = "l",col="blue")
  title(main = "one lag in a trapezoidal array",sub = subtitle)
  graphics.off()

  cat("lag= ",lag,"\n")
  cat("cutOffValue= ",cutOffValue,"\n")
  cat("type= ",type,"\n")

  cat(" End of test BenchmarkBetaLRVAndBetaLRVHatGrowSize ","\n")
}
