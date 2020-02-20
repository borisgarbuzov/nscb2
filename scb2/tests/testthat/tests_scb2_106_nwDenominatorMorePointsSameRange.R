test_that(desc = "Testing  \'nwDenominatorBandwidthChange\'",
          code = {
            testUtilNwDenominatorMorePointsWiderRange(arguments = c(0,3,6),
                                                      bandwidth = 0.1,
                                                      blockCount = 10,
                                                      numberOftests = 5)
          })
