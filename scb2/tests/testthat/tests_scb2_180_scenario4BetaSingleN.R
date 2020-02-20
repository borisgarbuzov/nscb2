test_that(desc = "Testing \'scenario4BetaSingleN\'",
          code = {
            testUtilScenario4BetaSingleN(tParCount = 11,
                                         sampleSize = 100,
                                         sigma = 2,
                                         maxLag = 2,
                                         lag = 1,
                                         bDegree = 1/2,
                                         mySeed = 42,
                                         bDegreeForGamma = 1/4)
          })
