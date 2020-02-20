testUtil123SquaredBatchBlockSums <- function(sample,
                                             batchSize,
                                             expectedSample,
                                             expectedLength){
  cat("\n Testing \'123squaredBatchBlockSums\' \n")

  cat("\nTest parameters:", "\n")
  cat("sample =", sample, "\n")
  cat("batchSize =", batchSize, "\n")

  squaredBatchSum <- sampleSplit(sample = sample,
                                 batchSize = batchSize)

  cat("Result:\n")

  expect_equal(object = length(squaredBatchSum), expected = expectedLength)
  expect_equal(object = squaredBatchSum, expected = expectedSample)

  cat("squaredBatchSum =", squaredBatchSum, "\n")
  cat("expected squaredBatchSum =", expectedSample, "\n")

  cat("End of test 123squaredBatchBlockSums", "\n")

  cat("=====================\n")
}
