testUtilComputeKernelLrvHat <- function(squaredBatchSumArray,
                                        kernelArray,
                                        sampleSize,
                                        batchSize){

  cat("\n Testing \'tests_scb2_146_computeKernelLrvHat\ \n")

  cat("\nTest parameters :", "\n")

  cat("squaredBatchSumArray = ", squaredBatchSumArray, "\n")
  cat("kernelArray = ", kernelArray, "\n")
  cat("sampleSize = ", sampleSize, "\n")
  cat("batchSize = ", batchSize, "\n")

  Start <- Sys.time()
  kernelLrvHat <- computeKernelLrvHat(
    squaredBatchSumArray = squaredBatchSumArray,
    kernelArray = kernelArray,
    sampleSize = sampleSize,
    batchSize = batchSize)

  myKernelLrvHat <- sum(kernelArray*squaredBatchSumArray)/(batchSize*(sampleSize-batchSize+1))


  if(kernelLrvHat != myKernelLrvHat){
    warning("wrong value")
    exit()
  }


  End <- Sys.time()
  duration <- End - Start


  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")


  expect_that(kernelLrvHat , is_a("numeric"))
  testUtilObjectSize(kernelLrvHat)

  cat(" kernelLrvHat =", kernelLrvHat, "\n")
  cat("\n")
  cat("End of test createDiagHorSamples", "\n")

  cat("=====================\n")
}
