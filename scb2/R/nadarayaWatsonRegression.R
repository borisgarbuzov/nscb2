nadarayaWatsonRegression <- function(lrvArray,
                                     extentedArguments,
                                     baseArguments,
                                     bandwidth)
{
  numerator <- nwNumerator(extentedArguments = extentedArguments,
                           baseArguments = baseArguments,
                           lrvArray = lrvArray,
                           bandwidth = bandwidth)
  denominator <- nwDenominator(extentedArguments = extentedArguments,
                               baseArguments = baseArguments,
                               bandwidth = bandwidth)
  return(numerator/denominator)
}
