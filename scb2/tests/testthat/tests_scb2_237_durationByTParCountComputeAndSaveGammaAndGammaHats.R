test_that(desc = "Testing  \'durationByTParCountComputeAndSaveGammaAndGammaHats\'",
          code = {
            testUtilDurationByTParCountComputeAndSaveGammaAndGammaHats(
              sampleSize = 10,
              minTParCount = 2,
              maxTParCount = 3,
              tParCountStep = 1,
              gammaHatCount = 1
            )
          })
