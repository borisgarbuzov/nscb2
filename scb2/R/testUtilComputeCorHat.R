#'@export
testUtilComputeCorHat<- function(tParArray,
                                 lag,
                                 sample,
                                 bandwidth)
{
  kernel=customKernel
  mySampleSize=length(sample)
  myCovariance = testUtilComputeCovHat(tParArray,
                                       lag = lag,
                                       sample,
                                       bandwidth = bandwidth)


  myVariance = testUtilComputeCovHat(tParArray,
                                     lag = 0,
                                     sample,
                                     bandwidth = bandwidth)

  corHat = myCovariance / myVariance
}
