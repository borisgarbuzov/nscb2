testUtilNwDenominatorMorePointsWiderRange <- function(arguments,
                                                      bandwidth,
                                                      blockCount,
                                                      numberOftests)
{
  cat("\nTesting \'tests_scb2_107_nwDenominatorMorePointsWiderRange\' \n")

  cat("Test parameters:", "\n")
  cat("blockCount =", blockCount, "\n")
  cat("bandwidth = ",bandwidth,"\n")
  cat("numberOftests = ",numberOftests,"\n")
  cat("arguments =");print(arguments);cat("\n")
  path <- doPath("denominator_test3")

  for (index in 1:numberOftests) {

    argumentsLengh <- length(arguments)

    subtitle <- paste0("bandwidth = ",bandwidth)
    extentedArguments <- linspace(-1,argumentsLengh+1,1000)
    denominator <- array(data = 0,dim = length(extentedArguments))
    for (tparIndex in 1:length(extentedArguments))
    {
      for(argumentIndex in 1:argumentsLengh)
      {
        x_i <- arguments[argumentIndex]
        denominator[tparIndex] <- denominator[tparIndex]+
          customKernel(extentedArguments[tparIndex]-x_i,
                       bandwidth = bandwidth)
      }
    }

    values <- max(denominator)/4
    valuesArray <- array(data = values,dim = length(arguments))

    fileName = "denominator_test3_"
    fileName <- paste0(fileName,argumentsLengh)
    saveJpg(fileName = fileName,path = path)
    plot(extentedArguments,denominator,type = "l",
         main = "NW denominator. Fixed bandwidth, more and more\n x points keeping the same distance between them",
         sub = subtitle)
    points(x=arguments,y = valuesArray,type = "h",col="blue")
    graphics.off()
    arguments <- c(arguments,tail(arguments,1)+1)

  }
  cat("End of test nwDenominatorMorePointsWiderRange","\n")

  cat("=====================\n")
}
