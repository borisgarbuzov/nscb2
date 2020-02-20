test_that(desc = "Testing  \'localLRV\'",
          code = {
            testUtilLocalLRV(sampleSize =  500,
                             blockCount = 10,
                             batchSize = 10,
                             bandwidth = 0.1,
                             type = "NW")
          })
