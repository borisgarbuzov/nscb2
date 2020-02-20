test_that(desc = "Testing  \'computeAndSaveTrueBetaLRVAndBetaLRVHat\'",
          code = {
            testUtilComputeAndSaveTrueBetaLRVAndBetaLRVHat(
              sampleSize = 100,
              tParCount = 11,
              lag = 1,
              betaLRVHatCount = 2,
              sigma = 2,
              mean = 0,
              noise = NULL,
              type = "ScaledNoise",
              typeOfKernel = "gaussian",
              diagOrHoriz = "diag"
            )
          })
