testUtilLRVCompareSingleMatrixToCutter<-function(type="OB")
{
  sample <- rep(1,4)
  sample <- c(1,2, 3,4)
  batchSize <- 2
  testTitle <- paste0("tests_75_CompareLrvMatrixToCutter in type ",type, "\n")
  cat("\nTesting \'",testTitle,"\' \n")
  cat("Test parameters:", "\n")
  cat("batchSize =", batchSize, "\n")
  cat("sample ="); print(sample); cat("\n")
  cat("sampleSize =", length(sample), "\n")



  lrvFromMatrix <- estimateLRVbyQuadraticForm(sample = sample,type = type,batchSize = batchSize)
  lrvFromCutter <- switch (type,
    OB = computeLRVofOB2dArray(original = sample,batchSize = batchSize),
    NB = createLRVof2dArray(cutNB(original = sample,batchSize = batchSize))
  )

  cat ("\n lrvFromMatrix = ", lrvFromMatrix)
  cat ("\n lrvFromCutter = ", lrvFromCutter, "\n")
  comparisonResult <- compare(lrvFromMatrix,lrvFromCutter)
  if (!comparisonResult$equal)
  {
    stop("\n Two LRV values are not equal for type: ",type,"\n",comparisonResult$message)
  } else
  {
    cat("\n Two LRV values are equal, as they should be; type: ",type)
  }

  cat("\n End of test CompareLrvMatrixToCutter in type ",type,"\n")

  cat("=====================\n")
}
