testUtilCreateDiagHorSamples <- function(sampleSize,
                                        tParCount,
                                        mean,
                                        sigma) {

  cat("\n Testing \'tests_scb2_145_createDiagHorSamples\ \n")

  cat("\nTest parameters :", "\n")
  cat("sampleSize = ", sampleSize, "\n")
  cat("tParCount = ", tParCount, "\n")
  cat("mean = ", mean, "\n")
  cat("sigma = ", sigma, "\n")

  Start <- Sys.time()

  sampleList <- createDiagHorSamples(sampleSize = sampleSize,
                                    tParCount = tParCount,
                                    mean = mean,
                                    sigma = sigma)

  horizontal2dSample <- unlist(sampleList[1])

  diagonalSample <- unlist(sampleList[2])

  #create plots
  name <- "Testing \'tests_scb2_145_createListOfSamples horizontal2dSample"
  nameMain <- "This plot of horizontal2dSample"
  xlab = "number"
  ylab = "value horizontal2dSample"
  sub <- paste0("sampleSize =",
               sampleSize,
               " tParCount = ",
               tParCount,
               " mean =",
               mean,
               " sigma =",
               sigma)


  createPlot(arrayPlot = horizontal2dSample,
             name = name,
             nameMain = nameMain,
             type = 'p',
             sub = sub,
             xlab = xlab,
             ylab = ylab)


  ylab <- "value diagonalSample"
  name <- "Testing \'tests_scb2_145_createListOfSamples diagonalSample"
  nameMain <- "This plot of diagonalSample"

  createPlot(arrayPlot = diagonalSample,
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

  testUtilObjectSize(sampleList)

  expect_that(sampleList , is_a("list"))

  cat(" horizontal2dSample = \n")
  print(horizontal2dSample)
  cat("\n")
  cat(" diagonalSample = ", diagonalSample,"\n")

  #cat("\n")
#View(round(diagonalSample,2) )
#View(matrix(round(horizontal2dSample,2), nrow = 8, ncol = 10))
#  cat("\n")
  cat("End of test createListOfSamples", "\n")

  cat("=====================\n")

}
