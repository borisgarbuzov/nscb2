sampleSplit <- function(sample,
                        batchSize)
{
  sample <- sample[!is.na(sample)]
  sampleSize <- length(sample)

  if (batchSize <= 1) {
    warning("batch size is equal or less than 1")
  }

  squaredBatchSumArray <- array(data = 0, dim = sampleSize-batchSize+1)

  for(i in 1:(sampleSize-batchSize+1)){
    squaredBatchSumArray[i] <- (sum(sample[i:(i+batchSize-1)]))^2
  }

  return(squaredBatchSumArray)
}
