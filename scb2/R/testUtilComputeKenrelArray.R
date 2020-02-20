testUtilComputeKenrelArray <- function(sampleSize,
                                       tPar,
                                       bandWidth) {
  cat("\n Testing \'tests_scb2_148_computeKenrelArray\ \n")

  cat("\nTest parameters :", "\n")

  cat(" sampleSize = ", sampleSize, "\n")
  cat(" tPar = ", tPar, "\n")
  cat(" bandWidth = ", bandWidth, "\n")

  Start <- Sys.time()

  kernelArray <- computeKernelArray(sampleSize = sampleSize,
                                    tPar = tPar,
                                    bandWidth = bandWidth)

  myKernelArray <- array(data = 0, dim = (sampleSize))
  for(i in 1:(sampleSize)){
    myKernelArray[i] <- customKernel((i/sampleSize - tPar), bandWidth, "gaussian")
  }

  for(i in 1:length(kernelArray)){
    if(kernelArray[i] != myKernelArray[i]){
      warning("wrong value")
      exit()
    }
  }


  End <- Sys.time()
  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(kernelArray , is_a("array"))
  testUtilObjectSize(kernelArray)

  cat("kernelArray = \n")
  print(kernelArray)
  cat("\n")

  cat("End of test computeKernelArray", "\n")

  cat("=====================\n")
}
