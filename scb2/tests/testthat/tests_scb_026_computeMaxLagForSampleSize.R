computeMaxLagForSampleSizeFunction<-function()
{
  cat("\n Testing \'tests_26_computeMaxLagForSampleSize\' \n")
  mySampleSize=10
maxLag=computeMaxLagForSampleSize(sampleSize = mySampleSize)
cat("\n MaxLag= ",maxLag)

}

test_that("Testing \'computeMaxLagForSampleSize'", {
  computeMaxLagForSampleSizeFunction()
  cat("\n End of test computeMaxLagForSampleSize", "\n")
  cat("=====================")
})
