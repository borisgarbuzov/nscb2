computeKernelLrvHat <- function(squaredBatchSumArray,
                                kernelArray,
                                sampleSize,
                                batchSize
                                )
{
  kenrelLrvHat = sum(squaredBatchSumArray*kernelArray)/(batchSize*(sampleSize-batchSize+1))
  return(kenrelLrvHat)
}
