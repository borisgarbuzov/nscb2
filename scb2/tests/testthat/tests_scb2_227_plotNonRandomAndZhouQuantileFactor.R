test_that(desc = "Testing  \'plotNonRandomAndZhouQuantileFactor\'",
          code = {
            testUtilPlotNonRandomAndZhouQuantileFactor(
              minSampleSize = 100,
              maxSampleSize = 200,
              sampleSizeStep = 100,
              tParCount = 10,
              replicationCount = 10,
              nonCoverageProbability = 0.06
            )
          })
