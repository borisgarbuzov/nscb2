test_that(desc = "Testing  \'localLRV\'",
          code = {
            testUtilPcLocalLRVBandwidth(sampleSize =  500,
                                        blockCount = 10,
                                        batchSize = 10,
                                        bandwidth = linspace(0.01,0.5,15))
          })
