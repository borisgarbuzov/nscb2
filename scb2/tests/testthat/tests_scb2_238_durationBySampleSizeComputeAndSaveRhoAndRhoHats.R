test_that(desc = "Testing  \'durationBySampleSizeComputeAndSaveRhoAndRhoHats\'",
          code = {
            testUtilDurationBySampleSizeComputeAndSaveRhoAndRhoHats(
              fromSampleSize = 10,
              toSampleSize = 30,
              stepSampleSize = 10,
              tParCount = 11
            )
          })
