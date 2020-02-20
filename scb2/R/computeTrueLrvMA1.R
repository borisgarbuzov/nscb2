#the function is used to calculate true LRV in the experiment with MA1.
#The input is sigma (sigma) and tPar.
#The output is a trueLrv.

#called by computeTrueLrv


computeTrueLrvMA1 <- function(sigma,
                              tPar){
  trueLrv <- sigma^2*(1+customCoefFunction(tPar))
  return(trueLrv)
}
