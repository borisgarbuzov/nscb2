computeThetaArray <- function(indexArray,
                              sigma,
                              type = "X",
                              ...)
{
  thetaArray <- array(dim = length(indexArray))

  thetaFunc <- switch(type,
                        X = computeThetaX,
                        X2 = computeThetaQuad,
                        BlockSum = computeThetaBlockSum,
                        BlockSum2 = computeThetaBlockSumSquare,
                        MA1BlockSum = computeTheta
                      )
    for (index in 1:length(indexArray))
    {
      thetaArray[index] <- thetaFunc(index = indexArray[index],
                                     sigma = sigma,
                                     ... = ...)
    }

  return(thetaArray)
}
