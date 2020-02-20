testUtilNwDenominatorSmallerRange <- function(arguments,
                                                      bandwidth,
                                                      blockCount,
                                                      numberOftests)
{
  cat("\nTesting \'tests_scb2_108_nwDenominatorSmallerRange\' \n")

  cat("Test parameters:", "\n")
  cat("blockCount =", blockCount, "\n")
  cat("bandwidth = ",bandwidth,"\n")
  cat("numberOftests = ",numberOftests,"\n")
  cat("arguments =");print(arguments);cat("\n")
  path <- doPath("denominator_test4")

  for (index in 1:numberOftests) {

    argumentsLengh <- length(arguments)

    subtitle <- paste0("bandwidth = ",bandwidth,", argumentLengh =",argumentsLengh)
    extentedArguments <- linspace(-1,max(arguments)+1,1000)
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

    fileName = "denominator_test4_"
    fileName <- paste0(fileName,index)
    saveJpg(fileName = fileName,path = path)
    plot(extentedArguments,denominator,type = "l",
         main = "Keep number of points the same,\n and move them denser together.\n Decrease distance between the points. ",
         sub = subtitle)
    points(x=arguments,y = valuesArray,type = "h",col="blue")
    graphics.off()
    argumentsRange <- arguments[2]-arguments[1]
    argumentsRange <- argumentsRange/1.5
    print(arguments)


    for(argumentIndex in 2:length(arguments))
    {
      arguments[argumentIndex] <- arguments[(argumentIndex-1)] + argumentsRange
    }
    cat("argumentsRange")
  }
  cat("End of test nwDenominatorSmallerRange","\n")

  cat("=====================\n")
}
