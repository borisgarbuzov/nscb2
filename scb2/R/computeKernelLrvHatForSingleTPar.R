computeKernelLrvHatForSingleTPar <- function(sampleSize,
                                             squaredBatchSumArray,
                                             tPar,
                                             batchSize,
                                             bandWidth,
                                             typeOfKernel = "gaussian")
{
  kernelArray <- computeKernelArray(sampleSize = sampleSize,
                                    tPar = tPar,
                                    bandWidth = bandWidth,
                                    typeOfKernel = typeOfKernel)

  kenrelLrvHat <- computeKernelLrvHat(squaredBatchSumArray = squaredBatchSumArray,
                                      kernelArray = kernelArray,
                                      sampleSize = sampleSize,
                                      batchSize = batchSize)


  return(kenrelLrvHat)
}
