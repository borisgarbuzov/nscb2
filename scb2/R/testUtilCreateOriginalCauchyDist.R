testUtilCreateOriginalCauchyDist<- function(size,
                                          psi,
                                          mean)
{
  cat("\nTesting \'tests_03_createOriginalCauchyDist\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

  original <- createOriginalCauchyDist(size = size,
                                         psi = psi,
                                         mean = mean)
  sampleMean = mean(original)
  sampleVar = var (original)
  sampleSD = sd (original)

  cat("Result:\n")
  cat("originalMa1 =", original[1:5], "\n")
  cat("sampleMean =", sampleMean, "\n")
  cat("sampleSD =", sampleSD,"\n")
  cat("sampleVar =",sampleVar,"\n")

  expect_that(length(original), equals(size))
  cat(" - length of CreateOriginalCauchyDist array is all right. \n")
  cat("End of test CreateOriginalCauchyDist","\n")
  cat("=====================\n")
}
