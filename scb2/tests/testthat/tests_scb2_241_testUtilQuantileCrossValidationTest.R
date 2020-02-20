test_that(desc = "Testing  \'testUtilQuantileCrossValidationTest\'",
          code = {
            testUtilQuantileCrossValidationTest(
              sampleSize = 10,
              tParCount = 3,
              replicationCount = 1,
              lag = 2,
              sigma = 2,
              mean = 0,
              p = 0.95
            )
          })
