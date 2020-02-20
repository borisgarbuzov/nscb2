test_that(desc = "Testing  \'createNoiseScatterPlot\'",
          code = {
            testUtilCreateNoiseScatterPlot(
              sampleSize = 10,
              mean = 0,
              sigma = 2,
              replicationSize = 10
            )
          })
