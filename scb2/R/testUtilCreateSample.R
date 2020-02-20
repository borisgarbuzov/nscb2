#'@export
testUtilCreateSample <- function (sampleSize)
{
  cat("\n Testing \'tests_05_createSample\' for length and being numeric \n")
  mySampleSize =sampleSize
  Start=Sys.time()
  mockSample <- createSample(sampleSize = mySampleSize)
  End=Sys.time()
  Duration=End-Start
  cat("\nTest parameters :","\n")
  cat("sampleSize= ",sampleSize,"\n")
  cat("=====================","\n")
  cat("Duration= ",Duration,"\n")
  cat ("mockSample[1:5] =", mockSample[1:5], "\n")
  expect_that(mockSample, is_a("array"))
  cat(" End of test createSample","\n")
  cat("=====================")
}
