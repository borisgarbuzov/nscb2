computeMinSampleSizeForAlphaFunction<-function()
{

  cat("\n Testing \'tests_28_computeMinSampleSizeForAlpha\' \n")
  myAlpha=0.5
  minSampleSize=computeMinSampleSizeForAlpha(alpha = myAlpha)
  cat("minSampleSize = ",minSampleSize)
}

test_that("Testing \'computeMinSampleSizeForAlpha'", {
  computeMinSampleSizeForAlphaFunction()
  cat("\n End of test computeMinSampleSizeForAlpha", "\n")
  cat("=====================")
})
