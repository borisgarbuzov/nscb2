computeBetaCell <- function(sampleElement,
                            sampleElementPlusLag,
                            rhoHat,
                            gammaHat0)
{
  betaCell <- (sampleElement*sampleElementPlusLag - rhoHat*sampleElement^2)/gammaHat0
  return(betaCell)
}
