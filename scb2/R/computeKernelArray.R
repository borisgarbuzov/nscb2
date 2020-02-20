computeKernelArray <- function(sampleSize,
                               tPar,
                               bandWidth,
                               typeOfKernel = "gaussian")
{
  kernelArray <- array(data = 0, dim = (sampleSize))

  for(i in 1:length(kernelArray)){
    kernelArray[i] <- customKernel((i/sampleSize - tPar), bandWidth, typeOfKernel)
  }

  return(kernelArray)
}
