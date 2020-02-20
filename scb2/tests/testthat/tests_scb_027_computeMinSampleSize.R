computeMinSampleSizeFunction<-function()
{
  cat("\n Testing \'tests_27_computeMinSampleSize\' \n")
  myAlpha=0.5
 minSampleSize=computeMinSampleSize(alpha =myAlpha )
  cat("minSampleSize = ",minSampleSize)
}

test_that("Testing \'computeMinSampleSize'", {
  computeMinSampleSizeFunction()
  cat("\n End of test computeMinSampleSize", "\n")
  cat("=====================")
})
