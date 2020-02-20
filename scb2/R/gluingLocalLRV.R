gluingLocalLRV <- function(lrvArray,
                           extentedArguments,
                           baseArguments,
                           bandwidth,
                           type)
{
  localGamma <- switch (type,
    NW = nadarayaWatsonRegression(lrvArray = lrvArray,
                                  extentedArguments = extentedArguments,
                                  baseArguments = baseArguments,
                                  bandwidth = bandwidth),
    PC = priestleyChaoRegression(lrvArray = lrvArray,
                                 extentedArguments = extentedArguments,
                                 baseArguments = baseArguments,
                                 bandwidth = bandwidth)
  )
  return(localGamma)
}
