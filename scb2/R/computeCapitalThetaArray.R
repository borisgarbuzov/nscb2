computeCapitalThetaArray <- function(indexArray,
                                     sigma,
                                     type = "X",
                                     ...)
{
  bigFakeInf <-  1000
  bigFakeInfIndexArray <- 0:bigFakeInf

  bigFakeInfLambda<- sum(computeThetaArray(indexArray = bigFakeInfIndexArray,
                                            sigma = sigma,
                                            type = type,
                                            ... = ...))

  thetaArray <- computeThetaArray(indexArray = indexArray,
                                  sigma = sigma,
                                  type = type,
                                  ... = ...)
  capitalThetaArray <- array(dim = length(indexArray))
  capitalTheta <- bigFakeInfLambda
  for(indexCTheta in 1:length(indexArray))
  {
    capitalTheta <- capitalTheta - thetaArray[indexCTheta]
    capitalThetaArray[indexCTheta] <- capitalTheta
  }
  return(capitalThetaArray)
}
