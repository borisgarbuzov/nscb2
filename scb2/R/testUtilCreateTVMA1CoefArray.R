#'@export
testUtilCreateTVMA1CoefArray <- function(samplesize) {
  cat("\n Testing \'tests_02_createTVMA1CoefArray\' for length and being numeric \n")


  sampleSize = samplesize
  Start=Sys.time()
  mockTVMA1CoefArray <- createTVMA1CoefArray(sampleSize = sampleSize)
  End=Sys.time()
  Duration=End-Start
  cat("\nTest parameters :","\n")
  cat("sampleSize= ",sampleSize,"\n")
  cat("=====================","\n")
  cat("Duration= ",Duration,"\n")
  cat ("mockTVMA1CoefArray =", mockTVMA1CoefArray[1:sampleSize], "\n",
       "length(mockTVMA1CoefArray) =", length(mockTVMA1CoefArray), "\n")
  #expect_that(mockTVMA1CoefArray, is_a("numeric"))
  cat(" End of test createTVMA1CoefArray","\n")
  cat("=====================")
}
