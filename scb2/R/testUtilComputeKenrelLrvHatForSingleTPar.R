testUtilComputeKenrelLrvHatForSingleTPar <- function(sampleSize,
                                                     squaredBatchSumArray,
                                                     tPar,
                                                     batchSize,
                                                     bandWidth) {
  cat("\n Testing \'tests_scb2_147_computeKenrelLrvHatForSingleTPar\ \n")

  cat("\nTest parameters :", "\n")

  cat(" sampleSize = ", sampleSize, "\n")
  cat(" squaredBatchSumArray = ", squaredBatchSumArray, "\n")
  cat(" tPar = ", tPar, "\n")
  cat(" batchSize = ", batchSize, "\n")
  cat(" bandWidth = ", bandWidth, "\n")

  Start <- Sys.time()

  kenrelLrvHat <- computeKernelLrvHatForSingleTPar(sampleSize = sampleSize,
                                                   squaredBatchSumArray = squaredBatchSumArray,
                                                   tPar = tPar,
                                                   batchSize = batchSize,
                                                   bandWidth = bandWidth)

  End <- Sys.time()
  duration <- End - Start


  cat("\n")
  cat("Result:\n")
  cat(" Duration =", duration, "\n")

  expect_that(kenrelLrvHat , is_a("numeric"))
  testUtilObjectSize(kenrelLrvHat)

  cat(" kenrelLrvHat =", kenrelLrvHat, "\n")
  cat("\n")
  cat("End of test computeKenrelLrvHatForSingleTPar", "\n")

  cat("=====================\n")

}
