computePrecision <- function(trueArray, hatDoubleArray){
  tParCount = length(trueArray)
  meanArray <- array(data = 0, dim = tParCount)
  biasArray <- array(data = 0, dim = tParCount)
  varianceArray <- array(data = 0, dim = tParCount)
  mseArray <- array(data = 0, dim = tParCount)
  for(t in 1:tParCount){
    meanArray[t] = mean(hatDoubleArray[t,])
    varianceArray[t] = var(hatDoubleArray[t,])
    # biasArray[t] = trueArray[t] - meanArray[t]
    biasArray[t] = meanArray[t] - trueArray[t]
    mseArray[t] = mean((hatDoubleArray[t,] - trueArray[t])^2)
  }
  precisionArray = list(meanArray = meanArray,
                        biasArray = biasArray,
                        varianceArray = varianceArray,
                        mseArray = mseArray)
  return(precisionArray)
}
