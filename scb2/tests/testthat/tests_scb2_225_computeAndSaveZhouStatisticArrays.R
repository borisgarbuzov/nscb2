test_that(desc = "Testing  \'computeAndSaveZhouStatisticArrays\'",
          code = {
            testUtilComputeAndSaveZhouStatisticArrays(
              tParCount = 10,
              replicationCount = 1,
              minSampleSize = 100,
              maxSampleSize = 200,
              sampleSizeStep = 100
              )
          })
