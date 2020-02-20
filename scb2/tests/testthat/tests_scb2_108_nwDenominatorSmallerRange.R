test_that(desc = "Testing  \'nwDenominatorSmallerRange\'",
          code = {
            testUtilNwDenominatorSmallerRange(arguments = c(0,3,6,9),
                                              bandwidth = 0.1,
                                              blockCount = 10,
                                              numberOftests = 5)
          })
