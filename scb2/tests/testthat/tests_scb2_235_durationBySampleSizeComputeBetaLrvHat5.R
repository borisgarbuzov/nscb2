test_that(desc = "Testing  \'durationBySampleSizeComputeBetaLrvHat5\'",
          code = {
            testUtilDurationBySampleSizeComputeBetaLrvHat5(
              fromSampleSize = 10,
              toSampleSize = 30,
              stepSampleSize = 10,
              tParCount = 11
            )
          })
