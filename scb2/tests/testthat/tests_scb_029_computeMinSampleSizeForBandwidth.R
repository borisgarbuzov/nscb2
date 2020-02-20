computeMinSampleSizeForBandwidthFunction<-function()
{

  cat("\n Testing \'tests_29_computeMinSampleSizeForBandwidth\' \n")

  minSampleSize=computeMinSampleSizeForBandwidth()
  cat("minSampleSize = ",minSampleSize)
}

test_that("Testing \'computeMinSampleSizeForBandwidth'", {
  computeMinSampleSizeForBandwidthFunction()
  cat("\n End of test computeMinSampleSizeForBandwidth", "\n")
  cat("=====================")
})
