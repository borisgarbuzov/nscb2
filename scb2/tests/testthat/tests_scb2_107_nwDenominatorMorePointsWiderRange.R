test_that(desc = "Testing  \'nwDenominatorBandwidthChange\'",
          code = {
            testUtilNwDenominatorMorePointsSameRange(arguments = c(0),
                                                     bandwidth = 0.1,
                                                     blockCount = 10,
                                                     numberOftests = 5)
          })
