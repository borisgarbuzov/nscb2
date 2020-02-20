#the function is used to calculate true LRV in the experiment with MA1.
#The input is sigma (sigma) and tPar.
#The output is a trueLrv.

#called by computeTrueLrv


computeTrueBetaLrvMA1 <- function(tPar){
  trueLrv <- 1+2*customCoefFunction(tPar)^2/(1+customCoefFunction(tPar)^2)^2
  return(trueLrv)
}
