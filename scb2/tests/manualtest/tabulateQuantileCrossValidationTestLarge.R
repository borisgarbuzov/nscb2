tabulateQuantileCrossValidationTestLarge <- function(sampleSize = 3000,
                                             tParCount = 11,
                                             replicationCount = 1000,
                                             lag = 2,
                                             sigma = 2,
                                             mean = 0,
                                             p = 0.95) {
  cat("Testing  \'testUtilQuantileCrossValidationTest\'\n")
  testUtilTabulatedQuantileCrossValidationTest(sampleSize = sampleSize,
                                               tParCount = tParCount,
                                               replicationCount = replicationCount,
                                               lag = lag,
                                               sigma = sigma,
                                               mean = mean,
                                               p = p)
}
