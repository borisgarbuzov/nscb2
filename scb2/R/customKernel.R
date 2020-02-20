#' @title customKernel
#'
#' @name customKernel
#'
#' @aliases customKernel
#'
#' @description Creating \code{ma1CoefArray}, that is, the array of time variant coefficients, based on \code{tParArray} using a coeffficients function. If no coefFunction provided, \code{ma1CoefArray} vector equals to \code{tParArray} vector.
#'
#' @param tParArray a T parameter, a.k.a. a sleeper parameter, a sequence of numbers {0, 1}.
#' @param coefFunction a coeffficients function, which is an underlying function used to generate \code{ma1CoefArray} vector.
#'
#' @return The vector of the array of time variant coefficients values corresponding to T parameter values.
#'
#' @examples
#'
#' createMA1CoefArray(coefFunction = sin, tParArray =  seq(from = 0, to = 1, length.out = 10))
#' createMA1CoefArray(coefFunction = sin, tParArray =  seq(from = 0, to = 1, by = 0.1))
#'
#' @export

customKernel <- function (u, bandwidth=0.1, typeOfKernel = "gaussian")
{
  v = u / bandwidth
  if(typeOfKernel == "boxcar"){
    #Boxcar
    if(abs(v) <= 1){
      kernel = (1/2)
    }else{
      kernel = (0)
    }
  }
  if(typeOfKernel == "triangular"){
    #Triangular
    if(abs(v) <= 1){
      kernel = (1 - abs(v))
    }else{
      kernel = (0)
    }
  }
  if(typeOfKernel == "epanechnikov"){
    #Epanechnikov
    if(abs(v) <= 1){
      kernel = (3/4*(1-v^2))
    }else{
      kernel = (0)
    }
  }
  if(typeOfKernel == "quartic"){
    #Quartic
    if(abs(v) <= 1){
      kernel = (15/16*(1-v^2)^2)
    }else{
      kernel = (0)
    }
  }
  if(typeOfKernel == "triweight"){
    #Triweight
    if(abs(v) <= 1){
      kernel = (35/32*(1-v^2)^3)
    }else{
      kernel = (0)
    }
  }
  if(typeOfKernel == "tricube"){
    #Tricube
    if(abs(v) <= 1){
      kernel = (70/81*(1-abs(v)^3)^3)
    }else{
      kernel = (0)
    }
  }
  if(typeOfKernel == "gaussian"){
    #Gaussian
    kernel = (dnorm(v))
  }

  if(typeOfKernel == "cosine"){
    #Cosine
    if(abs(v) <= 1){
      kernel = (pi/4*cos(pi/2*v))
    }else{
      kernel = (0)
    }}
  if(typeOfKernel == "logistic"){
    #Logistic
    kernel = (1/(exp(v)+2+exp(-v)))
  }
  if(typeOfKernel == "sigmoid"){
    #Sigmoid function
    kernel = (2/pi * (1/(exp(v)+exp(-v))))
  }
  if(typeOfKernel == "silverman"){
    #Silverman kernel
    kernel = 1/2 * exp(- (abs(v)/sqrt(2))) * sin(abs(v)/sqrt(2) + pi/4)
  }
  if(typeOfKernel == "normalDifference"){
    #Silverman kernel
    kernel = normalDifferenceKernel(v)
  }
  if(typeOfKernel == "vKernel"){
    if(v >= -1 && v <= 1){
      kernel = exp(1/((v)^2 - 1)) / 0.443993816
    }else{
      kernel = (0)
    }
  }
  return(kernel/bandwidth)
}
