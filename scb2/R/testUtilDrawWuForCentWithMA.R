testUtilDrawWuForCentWithMA <- function(sizeArray,
                                        numberOfExperiment,
                                        psiDepth,
                                        psi,
                                        sigma)
{
  cat("\nTesting \'tests_46_DrawWuForCentWithMA\' \n")
  mean = 0
  cat("Test parameters:", "\n")
  cat("sizeArray = ");print(sizeArray[1:5]);cat("\n")
  cat("numberOfExperiment =", numberOfExperiment, "\n")
  cat("psiDepth =", psiDepth, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

  options(expressions = 50000)

  fileName <- "wuForCentWithMA"
  fileName <- paste0(fileName,psiDepth)
  fileName <- timestampGenerator(fileName = fileName)
  mainTitle <- "Wu2009 For Centered sample with Original MA"
  mainTitle <- paste0(mainTitle,psiDepth," \nExpansion")
  subTitle <- paste0("mean = ",mean,
                     ", sigma = ",sigma,
                     ", psi = ",psi,
                     ", psiDepth = ",psiDepth)
  originalArray <- array(NA,dim = c(max(sizeArray),numberOfExperiment))
  for (indexCol in 1:numberOfExperiment) {
    temp <- createOriginalMAInfConstCoef(size = max(sizeArray),
                                         sigma = sigma,
                                         mean = mean,
                                         psi = psi,
                                         psiMaxSize = (psiDepth+1),
                                         psiIncrement = TRUE)
    originalArray[,indexCol] <- temp[,psiDepth]
  }

  originalLrv <- sigma^2*((1+psi*psiDepth)^2)



  lrv <- array(data = 0,dim = c(length(sizeArray),numberOfExperiment))
  for(indexSize in 2:length(sizeArray))
  {
    size <- sizeArray[indexSize]
    originalCut <- originalArray[1:indexSize,]
    for (indexCol in 1:numberOfExperiment) {
      lrv[indexSize,indexCol] <- estimateLRVWu2009ForCenteredSample(sample = originalCut[,indexCol])
    }
    #lrv[indexSize] <- estimateLRVWu2009ForNonCenteredSample(sample = originalCut)

    yMax <- max(lrv,originalLrv,na.rm = TRUE)
    yMin <- min(lrv,originalLrv,na.rm = TRUE)

    yMaxMinMargin <- sd(c(lrv,originalLrv)) * 0.5
    yMax <- yMax + yMaxMinMargin
    yMin <- yMin - yMaxMinMargin

    saveJpg(fileName = fileName,path = "./plots")

    matplot(x = sizeArray,y = lrv,type = "l",col="blue",ylim = c(yMin,yMax))
    abline(h=originalLrv)
    title(main = mainTitle,sub = subTitle)

    graphics.off()
  }
  cat("End of test DrawWuForCentWithMA","\n")

  cat("=====================\n")
}
