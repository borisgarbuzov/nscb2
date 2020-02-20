test_that(desc = "Testing  \'NwLocalLRVBandwidth\'",
          code = {
            testUtilNwLocalLRVBandwidth(sampleSize =  500,
                                        blockCount = 10,
                                        batchSize = 10,
                                        bandwidth = linspace(0.01,0.5,15))
          })
