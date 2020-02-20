#'@export
lrvProductColReplicated<-function(size,
                                  psi,
                                  sigma,...)
{
  cMatrix <- createCMatrix(size = size,
                           psi = psi,
                           sigma = sigma)

  lrvProductColReplicated = cMatrix [1,] + 2 * cMatrix [2,]
  return(lrvProductColReplicated)
}
