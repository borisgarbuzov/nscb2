test_that(desc = "Testing  \'computeAndSaveNonCoverageFreqVsME\'",
          code = {
            testUtilComputeAndSaveNonCoverageFreqVsME(
              sampleSize = 10,
              tParCount = 2,
              replicationCount = 1,
              meMin = 0,
              meMax = 1,
              meStep = 0.2,
              sigma = 2,
              mean = 0,
              lag = 2
            )
          })
