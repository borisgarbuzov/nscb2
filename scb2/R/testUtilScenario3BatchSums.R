testUtilScenario3BatchSums <- function(tParCount = 100,
                                       sampleSize = 1000,
                                       sigma = 2,
                                       pictureWidth = 2000,
                                       pictureHeight = 1000,
                                       isSeed = "random",
                                       typeOfKernel = "gaussian",
                                       noise = NULL,
                                       bDegree = -0.26){

  cat("\n Testing \'tests_scb2_165_scenario3BatchSums\' \n")

  cat("\nTest parameters :", "\n")

  cat("tParCount = ", tParCount, "\n")
  cat("sampleSize = ", sampleSize, "\n")
  cat("sigma = ", sigma, "\n")
  cat("isSeed = ", isSeed, "\n")
  cat("typeOfKernel = ", typeOfKernel, "\n")
  cat("bDegree = ", bDegree, "\n")

  Start <- Sys.time()

  scenario3BatchSums(
                  tParCount = tParCount,
                  sampleSize = sampleSize,
                  sigma = sigma,
                  pictureWidth = pictureWidth,
                  pictureHeight = pictureHeight,
                  isSeed = isSeed,
                  typeOfKernel = typeOfKernel,
                  noise = noise,
                  bDegree = bDegree
  )

  End <- Sys.time()

  duration <- End - Start

  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test scenario3BatchSums", "\n")

  cat("=====================\n")
}
