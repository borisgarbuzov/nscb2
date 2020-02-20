test_that(desc = "Testing  \'computeAndSaveRhoAndRhoHats\'",
          code = {
            testUtilComputeAndSaveRhoAndRhoHats(
              sampleSize = 100,
              tParCount = 11,
              lag = 1,
              rhoHatCount = 2,
              sigma = 2,
              mean = 0,
              noise = NULL,
              type = "ScaledNoise",
              diagOrHoriz = "diag"
            )
          })
