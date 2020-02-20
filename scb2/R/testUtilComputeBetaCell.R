testUtilComputeBetaCell <- function(sampleElement,
                                    sampleElementPlusLag,
                                    rhoHat,
                                    gammaHat0,
                                    expected){
  cat("\n Testing \'tests_scb2_196_computeBetaCell\' \n")

  cat("\nTest parameters:", "\n")
  cat("sampleElement =", sampleElement, "\n")
  cat("sampleElementPlusLag =", sampleElementPlusLag, "\n")
  cat("rhoHat =", rhoHat, "\n")
  cat("gammaHat0 =", gammaHat0, "\n")
  cat("expected =", expected)

  Start <- Sys.time()

  beta <- computeBetaCell(sampleElement = sampleElement,
                          sampleElementPlusLag = sampleElementPlusLag,
                          rhoHat = rhoHat,
                          gammaHat0 = gammaHat0)

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")
  expect_equal(object = beta, expected = expected)
  cat("Beta =", beta, "\n")

  cat("End of test computeBetaCell", "\n")
  cat("=====================\n")
}
