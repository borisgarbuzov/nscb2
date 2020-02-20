computeModError <- function(trueRhoArray,
                            trueBetaLrvArray,
                            rhoHatArray) {
  modifiedError <- max(abs((rhoHatArray - trueRhoArray) / sqrt(trueBetaLrvArray)))
  return(modifiedError)
}
