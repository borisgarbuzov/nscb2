computeGaussKernel <- function(u){
  return( (exp(-1/2*u^2) )/( (2*pi)^(1/2) ) )
}
