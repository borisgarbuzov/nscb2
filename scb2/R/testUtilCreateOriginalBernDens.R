testUtilCreateOriginalBernDens<- function(size,
                                          psi,
                                          mean)
{
  cat("\nTesting \'tests_09_createOriginalBernDens\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

  originalBern <- createOriginalBernDens(size = size,
                                         psi = psi,
                                         mean = mean)
  sampleMean = mean(originalBern)
  sampleVar = var (originalBern)
  sampleSD = sd (originalBern)

  cat("Result:\n")
  cat("originalMa1 =", originalBern[1:5], "\n")
  cat("sampleMean =", sampleMean, "\n")
  cat("sampleSD =", sampleSD,"\n")
  cat("sampleVar =",sampleVar,"\n")

  #expect_that(length(originalBern), equals(size))
  cat(" - length of createOriginalBernDens array is all right. \n")
  cat("End of test createOriginalBernDens","\n")
  cat("=====================\n")
}
