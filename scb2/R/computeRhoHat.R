computeRhoHat <- function(gammaHat, gammaHat0){

  if(gammaHat0 != 0){
    rhoHat = gammaHat/gammaHat0
  }else{
    rhoHat = 1
  }

  return(rhoHat)
}
