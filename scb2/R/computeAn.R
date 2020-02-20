computeAn <- function(indexArray,
                      sigma,
                      type,
                      ...)
{
  An <- array(dim = length(indexArray))
  lambda <- computeLambdaArray(indexArray = indexArray,
                               sigma = sigma,
                               type = type,
                               ... = ...)
  An[1] <- lambda[1]^2
  for(indexA in 2:length(indexArray))
  {
    An[indexA] <- An[indexA-1]+lambda[indexA]^2
  }
  return(An)
}
