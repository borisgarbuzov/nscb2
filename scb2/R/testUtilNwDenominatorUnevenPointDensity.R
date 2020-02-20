testUtilNwDenominatorUnevenPointDensity <- function(bandwidth,
                                              numberOftests)
{
  cat("\nTesting \'tests_scb2_109_nwDenominatorUnevenPointDensity\' \n")

  cat("Test parameters:", "\n")
  cat("bandwidth = ",bandwidth,"\n")
  cat("numberOftests =");print(numberOftests);cat("\n")
  path <- doPath("denominator_test5")
  for (shape in numberOftests) {

    arguments <- rbeta(10,1,shape2 = shape)

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

    fileName = "denominator_test5_"
    fileName <- paste0(fileName,round(shape,digits = 2))
    saveJpg(fileName = fileName,path = path)
    plot(extentedArguments,denominator,type = "l",
         main = "Keep number of points the same,\n and move them denser together.\n Decreasing homogeneity o distance.  ",
         sub = subtitle)
    lines(x = extentedArguments, y = (dbeta(x =extentedArguments,shape1 = 1,shape2 = shape )*2),
          lty = "dashed",col="red")
    points(x=arguments,y = valuesArray,type = "h",col="blue")
    graphics.off()
    argumentsRange <- arguments[2]-arguments[1]
    argumentsRange <- argumentsRange/1.5
    print(arguments)
  }
  cat("End of test nwDenominatorUnevenPointDensity","\n")

  cat("=====================\n")
}
