computeAndSavePrecision <- function(trueArray,
                                    hatDoubleArray,
                                    parList) {

  # call compute function that will return mean, bias, variance and MSE
  precisions <- computePrecision(trueArray = trueArray,
                                 hatDoubleArray = hatDoubleArray)

  # call plot function to create csv and 4 graphs
  plotPrecision(precisions = precisions, trueArray = trueArray,
                parList = parList)
}
