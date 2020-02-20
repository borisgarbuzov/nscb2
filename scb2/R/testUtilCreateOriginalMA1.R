#' @export

testUtilCreateOriginalMA1 <- function(size,
                                      psi,
                                      sigma,
                                      mean) {
  cat("\nTesting \'tests_04_createOriginalMA1\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")

  Start <- Sys.time()

  originalMA1 <- createOriginalMA1(size = size,
                                   psi = psi,
                                   sigma = sigma,
                                   mean = mean)

  sampleMean = mean(originalMA1)
  sampleVar = var (originalMA1)
  sampleSD = sd (originalMA1)
  theoreticalVarOriginal = sigma^2 * (1 + psi^2)
  yMax <- max(originalMA1,sampleMean,sampleMean + sampleSD,sampleMean - sampleSD,mean + sigma,mean - sigma)
  yMin <- min(originalMA1,sampleMean,sampleMean + sampleSD,sampleMean - sampleSD,mean + sigma,mean - sigma)
  yMax5 <- yMax *0.1
  yMin5 <- yMin * 0.05
  End <- Sys.time()

  duration <- End - Start

  cat("Result:\n")
  cat("originalMa1 =", originalMA1[1:5], "\n")
  plot (originalMA1,xlab = "",ylim=c(yMin-yMin5,yMax+yMax5))
  abline(h = mean,col="blue")
  abline(h = sampleMean,col="brown")
  abline(h = sampleMean + sampleSD,col="green")
  abline(h = sampleMean - sampleSD,col="green")
  abline(h = mean + sigma,col="red")
  abline(h = mean - sigma,col="red")
  legend("topleft",legend = c("mean","sampleMean","sampleMean+-SampleSD","mean+-sigma")
         ,fill = c("blue","brown","green","red"))
  title(main = "OriginalMa1",sub = paste0("sampleSD =",sampleSD," ,sigma = ",sigma,", \nsampleVar =",
                                          sampleVar,", TheoreticalVarOriginal = ",theoreticalVarOriginal))
  # abline sampleMean, mean of different colors
  cat("sampleMean =", sampleMean, "\n")
  cat("mean =", sampleMean, "\n")
  cat("Should be similar", "\n")
  cat("sampleVar =", sampleVar, "\n")
  cat("theoreticalVarOriginal =", theoreticalVarOriginal, "\n")
  cat("Should be similar", "\n")


  expect_that(length(originalMA1), equals(size))
  cat(" - length of originalMa1 array is all right. \n")
  cat("Duration =", duration, "\n")
  testUtilObjectSize(originalMA1)
  cat("End of test createOriginalMA1","\n")
  cat("=====================\n")
}
