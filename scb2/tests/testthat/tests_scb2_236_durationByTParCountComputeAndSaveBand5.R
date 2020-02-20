test_that(desc = "Testing  \'durationByTParCountComputeAndSaveBand5\'",
          code = {
            testUtilDurationByTParCountComputeAndSaveBand5(
              sampleSize = 10,
              minTParCount = 2,
              maxTParCount = 3,
              tParCountStep = 1
            )
          })
