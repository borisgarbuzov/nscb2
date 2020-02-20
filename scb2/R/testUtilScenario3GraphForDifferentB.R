testUtilScenario3GraphForDifferentB <- function(tParCount = 11,
                                                tIndex = 4,
                                                sd = 2,
                                                sampleSize = 1000,
                                                pictureWidth = 3000,
                                                pictureHeight = 1500,
                                                isSeed = "random",
                                                renevalOrExpansion = "renewal",
                                                typeOfKernel = "gaussian",
                                                bDegree = -0.26,
                                                bArray = seq(0.01, 2, 0.01),
                                                nameOfFile = "output/DifferentB"){


  cat("\n Testing \'tests_scb2_156_scenario3GraphForDifferentB\ \n")

  cat("\nTest parameters :", "\n")

  cat("tParCount = ", tParCount, "\n")
  cat("tIndex = ", tIndex, "\n")
  cat("sd = ", sd, "\n")
  cat("sampleSize = ", sampleSize, "\n")
  cat("isSeed = ", isSeed, "\n")
  cat("renevalOrExpansion = ", renevalOrExpansion, "\n")
  cat("typeOfKernel = ", typeOfKernel, "\n")
  cat("bDegree = ", bDegree, "\n")
  cat("bArray = ", bArray, "\n")

  Start <- Sys.time()

  scenario3GraphForDifferentB(tParCount = tParCount,
                              tIndex = tIndex,
                              sd = sd,
                              sampleSize = sampleSize,
                              pictureWidth = pictureWidth,
                              pictureHeight = pictureHeight,
                              isSeed = isSeed,
                              renevalOrExpansion = renevalOrExpansion,
                              typeOfKernel = typeOfKernel,
                              bDegree = bDegree,
                              bArray = bArray,
                              nameOfFile = nameOfFile)


  End <- Sys.time()
  duration <- End - Start


  cat("\n")
  cat("Result:\n")
  cat("Duration =", duration, "\n")

  cat("End of test scenario3GraphForDifferentB", "\n")

  cat("=====================\n")
}
