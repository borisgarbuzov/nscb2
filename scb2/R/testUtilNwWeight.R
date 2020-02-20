arguments <- c(0,3,6,9)
bandwidth <- 0.5
numberOftests <- 10
testUtilNwWeight <- function(arguments,
                             bandwidth,
                             numberOftests)
{
  cat("\nTesting \'tests_scb2_110_nwWeight\' \n")

  cat("Test parameters:", "\n")
  cat("bandwidth = ",bandwidth,"\n")
  cat("numberOftests = ",numberOftests,"\n")
  cat("arguments =");print(arguments);cat("\n")
  path <- doPath("denominator_test5")
  path <- doPath("PrestleyChaoWeightTest")

  argumentsLengh <- length(arguments)

  subtitle <- paste0("bandwidth = ",bandwidth,", argumentLengh =",argumentsLengh)
  extentedArguments <- linspace(-1,max(arguments)+1,2000)
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
  weightMatrix <- matrix(nrow = length(extentedArguments),ncol = length(arguments))
  for(partIndex in 1:length(extentedArguments))
  {
    for(argumentIndex in 1:argumentsLengh)
    {
      x_i <- arguments[argumentIndex]
      weightMatrix[partIndex,argumentIndex] <- customKernel(extentedArguments[partIndex]-x_i,bandwidth = bandwidth)

    }
  }
  values <- max(weightMatrix)/4
  valuesArray <- array(data = values,dim = length(arguments))

  fileName <- "weightDenominator"
  saveJpg(fileName = fileName, path = path)
  plot(x = extentedArguments, y = denominator,
       main = "weightDenominator", type = "l")
  graphics.off()

  fileName = "weightWithoutDenominator"
  saveJpg(fileName = fileName, path = path)
  matplot(x = extentedArguments,y = weightMatrix,type = 'l',xlim = c(0,9),
          main = "Nadaraya-Watson Weight Without Denominator")
  points(x=arguments,y = valuesArray,type = "h",col="blue")
  graphics.off()

  for (argumentIndex in 1:argumentsLengh) {
    weightMatrix[,argumentIndex] <- weightMatrix[,argumentIndex]/denominator
  }

  values <- max(weightMatrix)/4
  valuesArray <- array(data = values,dim = length(arguments))

  fileName = "weightWithDenominator"
  saveJpg(fileName = fileName,path = path)
  matplot(x = extentedArguments,y = weightMatrix,type = 'l',xlim = c(0,9),
          main = "Nadaraya-Watson Weight With Denominator")
  points(x=arguments,y = valuesArray,type = "h",col="blue")
  graphics.off()
  cat("End of test nwWeight","\n")

  cat("=====================\n")
}
