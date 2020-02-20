computeGammaHat <- function(sample,
                            lag,
                            kernelArray = NULL){
  sampleSize <- length(sample)
  sampleSums <- 0

  if(!is.null(kernelArray)){
    for(sampleIndex in 1:(sampleSize-lag)){
    sampleSums = sampleSums + sample[sampleIndex] *
      sample[sampleIndex+lag] * kernelArray[sampleIndex]
    }
  }else{
    for(sampleIndex in 1:(sampleSize-lag)){
      sampleSums = sampleSums + sample[sampleIndex] *
        sample[sampleIndex+lag]
    }
  }

  gammaHat <- sampleSums/(sampleSize)
  return(gammaHat)
}
