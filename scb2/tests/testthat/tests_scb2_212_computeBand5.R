test_that(desc = "Testing  \'computeBand5\'",
          code = {
            testUtilComputeBand5(
              sampleSize = 100,
              testSample = NULL,
              tParCount = 11,
              lag = 2,
              sigma = 2,
              mean = 0,
              noise = NULL,
              nonCoverageProbability = 0.2,
              type = "ScaledNoise",
              diagOrHoriz = "diag",
              typeOfKernel = "gaussian"
            )
          })
