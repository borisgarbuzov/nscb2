#'@export
testUtilLRVProductColReplicated=function(size,psi,sigma)
{
  cat("\nTesting \'tests_13_createLRVProductColReplicated\' \n")
  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("sigma =", sigma, "\n")
  cat("=====================\n")
  Start=Sys.time()
 lrvProductCol=lrvProductColReplicated(size=size,psi=psi,sigma = sigma)
 End=Sys.time()
 duration=End-Start
  cat("lrvProductCol =",lrvProductCol,"\n")
  cat("Duration =", duration, "\n")
  cat("End of test createLRVProductColReplicated","\n")
  cat("=====================\n")
}
