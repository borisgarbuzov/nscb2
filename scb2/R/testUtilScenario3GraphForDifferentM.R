testUtilScenario3GraphForDifferentM <- function(tParCount = 11,
                                                tIndex = 4,
                                                sigma = 2,
                                                sampleSize = 10000,
                                                pictureWidth = 3000,
                                                pictureHeight = 1500,
                                                isSeed = "random",
                                                renevalOrExpansion = "renewal",
                                                typeOfKernel = "gaussian",
                                                bDegree = -0.26,
                                                mArray = seq(1, 400, 1),
                                                nameOfFile = "output/DifferentM"){

  cat("\n Testing \'tests_scb2_155_scenario3GraphForDifferentM\ \n")

  cat("\nTest parameters :", "\n")

  cat("tParCount = ", tParCount, "\n")
  cat("tIndex = ", tIndex, "\n")
  cat("sigma = ", sigma, "\n")
  cat("sampleSize = ", sampleSize, "\n")
  cat("isSeed = ", isSeed, "\n")
  cat("renevalOrExpansion = ", renevalOrExpansion, "\n")
  cat("typeOfKernel = ", typeOfKernel, "\n")
  cat("bDegree = ", bDegree, "\n")
  cat("mArray = ", mArray, "\n")

  Start <- Sys.time()


  scenario3GraphForDifferentM(tParCount = tParCount,
                              tIndex = tIndex,
                              sigma = sigma,
                              sampleSize = sampleSize,
                              pictureWidth = pictureWidth,
                              pictureHeight = pictureHeight,
                              isSeed = isSeed,
                              renevalOrExpansion = renevalOrExpansion,
                              typeOfKernel = typeOfKernel,
                              bDegree = bDegree,
                              mArray = mArray,
                              nameOfFile = nameOfFile)


  End <- Sys.time()
  duration <- End - Start


  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test scenario3GraphForDifferentM", "\n")

  cat("=====================\n")
}
