testUtilNwDenominatorMorePointsSameRange <- function(arguments,
                                             bandwidth,
                                             blockCount,
                                             numberOftests)
{
  cat("\nTesting \'tests_scb2_106_nwDenominatorMorePointsSameRange\' \n")

  cat("Test parameters:", "\n")
  cat("blockCount =", blockCount, "\n")
  cat("bandwidth = ",bandwidth,"\n")
  cat("numberOftests = ",numberOftests,"\n")
  cat("arguments =");print(arguments);cat("\n")
  path <- doPath("denominator_test2")
  for (index in 1:numberOftests) {

    argumentsLengh <- length(arguments)

    subtitle <- paste0("bandwidth = ",bandwidth)
    extentedArguments <- linspace(-1,max(arguments)+1,1000)

    denominator <- nwDenominator(extentedArguments = extentedArguments,
                                 baseArguments = arguments,
                                 bandwidth = bandwidth)
    values <- max(denominator)/4
    valuesArray <- array(data = values,dim = length(arguments))

    fileName = "denominator_"
    fileName <- paste0(fileName,argumentsLengh)
    saveJpg(fileName = fileName,path = path)
    plot(extentedArguments,denominator,type = "l",
         main = "NW denominator. Fixed bandwidth,\n more and more x points on the same range",
         sub = subtitle)
    points(x = arguments,y = valuesArray,type = "h",col = "blue")
    graphics.off()
    newArgs <- c()
    for(argumentIndex in 2:argumentsLengh)
    {
      newArgs<-c(newArgs,arguments[argumentIndex]+arguments[argumentIndex-1])
    }
    newArgs <- newArgs/2
    arguments <- c(arguments,newArgs)
    arguments <- sort(arguments)
  }
  cat("End of test nwDenominatorMorePointsSameRange","\n")

  cat("=====================\n")
}
