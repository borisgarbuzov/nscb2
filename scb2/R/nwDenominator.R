nwDenominator <- function(extentedArguments,
                          baseArguments,
                          bandwidth)
{
  denominator <- array(data = 0,dim = length(extentedArguments))
  for (tparIndex in 1:length(extentedArguments))
  {
    for(argumentIndex in 1:length(baseArguments))
    {
      x_i <- baseArguments[argumentIndex]
      denominator[tparIndex] <- denominator[tparIndex]+
        customKernel(extentedArguments[tparIndex]-x_i,
                     bandwidth = bandwidth)
    }
  }
  return(denominator)
}
