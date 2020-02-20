test_that(desc = "Testing  \'computeAndSaveGammaAndGammaHats\'",
          code = {
            testUtilComputeAndSaveGammaAndGammaHats(
              sampleSize = 100,
              tParCount = 11,
              lag = 1,
              gammaHatCount = 2,
              sigma = 2,
              mean = 0,
              noise = NULL,
              type = "ScaledNoise",
              diagOrHoriz = "diag"
            )
          })
