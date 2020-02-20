priestleyChaoRegression <- function(lrvArray,
                                    extentedArguments,
                                    baseArguments,
                                    bandwidth)
{
  localGamma <- array(data = 0,dim = length(extentedArguments))

  for(tParIndex in 1:length(extentedArguments))
  {
    for(baseIndex in 2:length(baseArguments))
    {
      localGamma[tParIndex] <- localGamma[tParIndex] +
        (baseArguments[baseIndex]-baseArguments[baseIndex-1])*
        lrvArray[baseIndex] *
        customKernel(u = (extentedArguments[tParIndex]-baseArguments[baseIndex]),
                     bandwidth = bandwidth)
    }
  }
  return(localGamma)
}
