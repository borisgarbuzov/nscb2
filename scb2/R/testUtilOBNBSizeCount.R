testUtilOBNBSizeCount <- function(numberInFocus,
                 psi,
                 sigma,
                 mean)
{
  cat("\nTesting \'tests_67_testUtilOBNBSizeCount\' \n")

  cat("Test parameters:", "\n")
  cat("numberInFocus =", numberInFocus, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

  gammaLrv <- createGamma(sigma = sigma,
                          psi = psi)
  lrv <- gammaLrv[1]+2*gammaLrv[2]
  lrvOBForSize <- rep(NA,length(numberInFocus))
  lrvNBForSize <- rep(NA,length(numberInFocus))
  lrvOBForCount <- rep(NA,length(numberInFocus))
  lrvNBForCount<- rep(NA,length(numberInFocus))
  fileName <-"test_cutter"
  fileName <- timestampGenerator(fileName = fileName)
  subtitle <- paste0("numberInFocus\n","psi = ",psi,", sigma = ",sigma, " , mean = ",mean)
  for(index in 1:length(numberInFocus))
  {
    size <- numberInFocus[index]*numberInFocus[index]
    batchSizeForCol <- numberInFocus[index]

    original<-createOriginalMA1(size = size,
                                psi = psi,
                                sigma = sigma,
                                mean = mean)
    lrvOBForSize[index] <-computeLRVofOB2dArray(original = original,batchSize = batchSizeForCol)
    lrvNBForSize[index] <-createLRVof2dArray(cutNB(original = original,batchSize = batchSizeForCol))

    batchSizeNBForCount <- size/numberInFocus[index]
    batchSizeOBForCount <- size - numberInFocus[index] + 1
    lrvOBForCount[index] <- computeLRVofOB2dArray(original = original,batchSize = batchSizeOBForCount)
    lrvNBForCount[index] <- createLRVof2dArray(cutNB(original = original,batchSize = batchSizeNBForCount))
    saveJpg(fileName = fileName,path = "./plots/")
    par(mfrow=c(1,2),oma = c(0, 0, 2, 0))
    yMax <- max(lrvOBForSize,lrvNBForSize,na.rm = TRUE)
    yMin <- min(lrvOBForSize,lrvNBForSize,na.rm = TRUE)
    plot(numberInFocus,lrvOBForSize,type = "n",ylim = c(yMin-(yMin*0.05),yMax + (yMax*0.05)),xlab = "")
    legend("topleft",legend = c("OB","NB"),fill = c("blue","red"))
    abline(h=lrv)
    lines(numberInFocus,lrvOBForSize,col="blue")
    lines(numberInFocus,lrvNBForSize,col="red")
    title(main = "Fix in batchSize",sub =  subtitle)
    yMax <- max(lrvOBForCount,lrvNBForCount,na.rm = TRUE)
    yMin <- min(lrvOBForCount,lrvNBForCount,na.rm = TRUE)
    plot(numberInFocus,lrvOBForCount,type = "n",ylim = c(yMin-(yMin*0.05),yMax + (yMax*0.05)),xlab = "")
    legend("topleft",legend = c("OB","NB"),fill = c("blue","red"))
    abline(h=lrv)
    title(main = "Fix in batchCount",sub = subtitle)
    lines(numberInFocus,lrvOBForCount,col="blue")
    lines(numberInFocus,lrvNBForCount,col="red")

    mtext("Test for cutters OB NB", outer = TRUE, cex = 1.5)
    graphics.off()
    cat("\n numberInFocus:",numberInFocus[index]," batchSizeNBForCount: ",batchSizeNBForCount," batchSizeOBForCount: ",batchSizeOBForCount)

  }
  cat("End of test testUtilOBNBSizeCount","\n")

  cat("=====================\n")

}
