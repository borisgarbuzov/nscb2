testUtilplotKernelArray <- function(sampleSize,
                                    bOBMMin,
                                    bOBMMax,
                                    bOBMStep,
                                    tPar) {
  
  cat("\n Testing \'tests_scb2_239_plotKernelArray\' \n")
  
  cat("\nTest parameters:", "\n")
  cat("sampleSize =", sampleSize, "\n")
  cat("bOBMMin =", bOBMMin, "\n")
  cat("bOBMMax =", bOBMMax, "\n")
  cat("bOBMStep =", bOBMStep, "\n")
  cat("tPar =", tPar, "\n")
  
  Start <- Sys.time()
  
  plotKernelArray(
      sampleSize = sampleSize,
      bOBMMin = bOBMMin,
      bOBMMax = bOBMMax,
      bOBMStep = bOBMStep,
      tPar = tPar
    )
  
  End <- Sys.time()
  
  duration <- End - Start
  
  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  
  cat("End of test plotKernelArray", "\n")
  cat("=====================\n")
}