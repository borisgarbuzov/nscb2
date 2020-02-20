#' @export
test_that(desc = "Testing  \'scenario3SingleT\'",
          code = {
            testUtilScenario3SingleT(tParCount = 11,
                                     tIndex = 6,
                                     sd = 2,
                                     minSampleSize = 10,
                                     maxSampleSize = 100,
                                     sampleSizeStep = 10,
                                     bDegree = -1/2,
                                     bConst = 1,
                                     mConst = 1)
          })
