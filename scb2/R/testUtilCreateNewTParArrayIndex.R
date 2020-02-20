testUtilCreateNewTParArrayIndex <- function(tParArray,
                                            bandWidth){

  cat("\n Testing \'tests_scb2_150_createNewTParArrayIndex\' \n")

  cat("\nTest parameters :", "\n")
  cat(" tParArray = \n", tParArray, "\n")
  cat(" bandWidth = ", bandWidth, "\n")

  Start <- Sys.time()

  newTParArrayIndex <- createNewTParArrayIndex(tParArray = tParArray,
                                               bandWidth = bandWidth)

  #create plots
  name <- "Testing \'tests_scb2_150_createNewTParArrayIndex"
  nameMain <- "This plot of createNewTParArrayIndex"

  xlab = "number"
  ylab = "value newTParArrayIndex"
  sub <- paste0("bandWidth =",
                bandWidth)

  createPlot(arrayPlot = newTParArrayIndex,
             name = name,
             nameMain = nameMain,
             type = 'p',
             sub = sub,
             xlab = xlab,
             ylab = ylab)

  End <- Sys.time()
  duration <- End - Start

  cat("\n Result:\n")
  cat("Duration =", duration, "\n")
  testUtilObjectSize(newTParArrayIndex)

  expect_that(newTParArrayIndex , is_a("array"))

  cat(" newTParArrayIndex = ", newTParArrayIndex, "\n")
  cat("\n")

  cat("End of test createNewTParArrayIndex", "\n")

  cat("=====================\n")
}
