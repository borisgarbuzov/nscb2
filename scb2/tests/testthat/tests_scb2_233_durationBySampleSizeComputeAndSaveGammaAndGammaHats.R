test_that(desc = "Testing  \'durationBySampleSizeComputeAndSaveGammaAndGammaHats\'",
          code = {
            testUtilDurationBySampleSizeComputeAndSaveGammaAndGammaHats(
              fromSampleSize = 10,
              toSampleSize = 50,
              stepSampleSize = 10,
              tParCount = 2,
              gammaHatCount = 1
            )
          })
