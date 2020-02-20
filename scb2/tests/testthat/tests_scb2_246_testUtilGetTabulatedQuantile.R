test_that(desc = "Testing  \'getTabulatedQuantile\'",
          code = {
            testUtilGetTabulatedQuantile(
              sampleSize = 1000,
              nonCoverageProbability = 0.05
            )
          })
