testUtilCreateOriginalXminusX<- function(size,
                                    sd,
                                    mu)
{
  cat("\nTesting \'tests_24_createOriginalXminusX\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("sd =", sd, "\n")
  cat("mu =", mu, "\n")

  original <- createOriginalXminusX(size = size,
                               mu = mu,
                               sd = sd)

  cat("Result:\n")
  cat("originalMa1 =", original[1:5], "\n")


  expect_that(length(original), equals(size))
  cat(" - length of CreateOriginalXminusX array is all right. \n")
  cat("End of test CreateOriginalXminusX","\n")
  cat("=====================\n")
}
