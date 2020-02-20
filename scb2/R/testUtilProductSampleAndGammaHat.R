testUtilProductSampleAndGammaHat <- function(size,
                                             sigma,
                                             mean,
                                             psi,
                                             lag,
                                             tParCount)
{
  cat("\n Testing \'tests_scb2_143_ProductSampleAndGammaHat\ \n")
  cat("\nTest parameters :","\n")
  cat("size= ",size,"\n")
  cat("sigma= ",sigma,"\n")
  cat("mean= ",mean,"\n")
  cat("tParCount= ",tParCount,"\n")
  cat("psi= ",psi,"\n")
  cat("lag= ",lag,"\n")

  duration <- microbenchmark(
    {
      sampleMA1 <- createOriginalMA1(size = size,
                                     psi = psi,
                                     sigma = sigma,
                                     mean = mean)

      sampleWithLag <- array(dim = length(sampleMA1)-lag)

      for(index in 1:(length(sampleMA1)-lag))
      {
        sampleWithLag[index] <- sampleMA1[index]*sampleMA1[index+lag]
      }

      gammaHat <- computeCovHat(tParArray = createTParArray(tParCount),
                                lag = lag,
                                sample = sampleMA1)

    },times = 1L)

  duration <- summary(duration,unit = "s")$median

  yMax <- max(sampleWithLag,gammaHat)
  yMax <- yMax + 0.2*yMax

  yMin <- min(sampleWithLag,gammaHat)
  yMin <- yMin + 0.2*yMin

  mainTitle <- "comparing product sample with lag and gammaHat"
  subtitle <- subTitle <- paste0("lag = ",lag,", mean = ",mean,", sigma = ",sigma,", psi = ",psi,"\n",
                                 durationTime(duration)," bandwith = 1*size^-0.4",", sampleSize =",size)

  fileName <- "productSampleAndGammaHat"
  fileName <- timestampGenerator(fileName = fileName)

  saveJpg(fileName = fileName, path = "output")
  plot(createTParArray(length(sampleWithLag)), sampleWithLag, ylim =c(yMin,yMax), type = 'l',col = "green",xlab = "")
  lines(createTParArray(tParCount),gammaHat)
  title(main = mainTitle,sub = subtitle)
  graphics.off()

  cat(" End of test ProductSampleAndGammaHat ","\n")
}
