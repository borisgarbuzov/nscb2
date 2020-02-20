test_that(desc = "Testing  \'nwDenominatorSmallerRange\'",
          code = {
            testUtilNwDenominatorUnevenPointDensity(bandwidth = 0.1,
                                                    numberOftests = linspace(1,1,1))
          })
