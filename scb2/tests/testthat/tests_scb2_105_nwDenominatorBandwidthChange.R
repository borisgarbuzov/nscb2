test_that(desc = "Testing  \'nwDenominatorBandwidthChange\'",
          code = {
            testNwDenominatorBandwidthChange(blockCount = 10,
                                             bandwidth = linspace(0.01,1,10))
          })
