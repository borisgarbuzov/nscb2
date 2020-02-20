computeGammaHatTest <- function(X, k, K = NULL){
  n <- length(X)
  gammaSum <- 0

  if(!is.null(K)){
    for(i in 1:(n-k)){
      gammaSum = gammaSum + X[i] * X[i+k] * K[i]
    }
  }else{
    for(i in 1:(n-k)){
      gammaSum = gammaSum + X[i] * X[i+k]
    }
  }

  gammaHat <- gammaSum/(n)
  return(gammaHat)
}
