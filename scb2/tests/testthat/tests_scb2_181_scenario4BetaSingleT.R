test_that(desc = "Testing  \'scenario4BetaSingleT\'",
          code = {
            testUtilScenario4BetaSingleT(tParCount = 11,
                                     tIndex = 6,
                                     minSampleSize = 10,
                                     maxSampleSize = 100,
                                     sampleSizeStep = 10,
                                     sigma = 2,
                                     lag = 2,
                                     mySeed = 42,
                                     bDegree = 1/2)
          })
