test_that(desc = "Testing  \'computeAndSaveTwoHists\'",
          code = {
            testUtilComputeAndSaveTwoHists(
              sampleSize = 100,
              tParCount = 3,
              replicationCount = 1,
              lag = 2,
              sigma = 2,
              mean = 0
            )
          })
