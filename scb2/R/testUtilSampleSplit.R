testUtilSampleSplit <- function(sample,
                                batchSize) {
  cat("\n Testing \'tests_scb2_149_sampleSplit\ \n")

  cat("\nTest parameters :", "\n")
  cat(" sample = ", sample, "\n")
  cat(" batchSize = ", batchSize, "\n")

  Start <- Sys.time()

  squaredBatchSumArray <- sampleSplit(sample = sample,
                                      batchSize = batchSize)

  mySquaredBatchSumArray <- array(data=0, dim = (length(sample)-batchSize + 1))
  for(i in 1:length(mySquaredBatchSumArray)){
    mySquaredBatchSumArray[i] <- (sum(mySquaredBatchSumArray[i:(i+batchSize-1)]))^2
  }

  for(i in 1:length(squaredBatchSumArray)){
    if(squaredBatchSumArray[i] != mySquaredBatchSumArray[i]){
      warning("wrong value")
     # exit()
      #stop()
      break()
    }
  }

  End <- Sys.time()
  duration <- End - Start

  cat("\n Result:\n")
  cat("Duration =", duration, "\n")
  testUtilObjectSize(squaredBatchSumArray)

  expect_that(squaredBatchSumArray , is_a("array"))

  cat(" squaredBatchSumArray =", squaredBatchSumArray, "\n")
  cat("\n")

  cat("End of test sampleSplit", "\n")

  cat("=====================\n")
}
