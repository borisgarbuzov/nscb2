test_that(desc = "Testing  \'generateModErrorStatisticArray\'",
          code = {
            testUtilGenerateModErrorStatisticArray(
              sampleSize = 100,
              tParCount = 3,
              replicationCount = 1,
              lag = 2,
              sigma = 2,
              mean = 0
            )
          })
