nwNumerator <- function(extentedArguments,
                        baseArguments,
                        lrvArray,
                        bandwidth)
{
  numerator <- array(data=0,dim = length(extentedArguments))
  for(tparIndex in 1:length(extentedArguments))
  {
    for (blockIndex in 1:length(baseArguments)) {
      x_i <- baseArguments[blockIndex]
      numerator[tparIndex] <- numerator[tparIndex] +
        lrvArray[blockIndex] * customKernel(extentedArguments[tparIndex]-x_i,
                                            bandwidth = bandwidth)
    }
  }
  return(numerator)
}
