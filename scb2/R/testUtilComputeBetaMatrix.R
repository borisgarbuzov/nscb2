testUtilComputeBetaMatrix <- function(sample = sample,
                                      psi = psi,
                                      sigma = sigma,
                                      maxLag = maxLag,
                                      tPar = tPar,
                                      type = type
                                      ){

  cat("\n Testing \'tests_scb2_170_computeBetaMatrix\ \n")
  cat("\nTest parameters :", "\n")
  cat("sample = ", sample, "\n")
  cat("psi = ", psi, "\n")
  cat("sigma = ", sigma, "\n")
  cat("maxLag = ", maxLag, "\n")
  cat("tPar = ", tPar, "\n")
  cat("type = ", type, "\n")

  Start <- Sys.time()

  betaMatrix <- computeBetaMatrix(sample = sample,
                                  psi = psi,
                                  sigma = sigma,
                                  maxLag = maxLag,
                                  tPar = tPar,
                                  type = type)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  expect_that(betaMatrix , is_a("matrix"))
  testUtilObjectSize(betaMatrix)

  cat("betaMatrix =", betaMatrix, "\n")
  cat("End of test computeBetaMatrix", "\n")
  cat("=====================\n")
}
