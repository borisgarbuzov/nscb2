test_that(desc = "Testing  \'computeAndSaveSnakes3D\'",
          code = {
            testUtilComputeAndSaveSnakes3D(
              minSampleSize = 100,
              maxSampleSize = 200,
              sampleSizeStep = 100,
              bConstMin = 0.09,
              bConstMax = 0.1,
              bConstStep = 0.01,
              tParCount = 3,
              replicationCount = 2,
              lag = 2,
              sigma = 2,
              mean = 0,
              nonCoverageProbability = 0.06
            )
          })
