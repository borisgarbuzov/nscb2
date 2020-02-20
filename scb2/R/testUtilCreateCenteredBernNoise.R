testUtilCreateCenteredBernNoise <- function(size,
                                            prob)
{
  cat("\nTesting \'tests_08_createCenteredBernNoise\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("prob =", prob, "\n")

  centeredBernNoise <- createCenteredBernNoise(n = size,prob = prob)

  cat("centered BernNoise = ",centeredBernNoise[1:5],"\n")
  cat("End of test createCenteredBernNoise","\n")
  cat("=====================\n")
}
