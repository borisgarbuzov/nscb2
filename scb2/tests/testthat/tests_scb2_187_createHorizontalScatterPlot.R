test_that(desc = "Testing  \'createHorizontalScatterPlot\'",
          code = {
            testUtilCreateHorizontalScatterPlot(
              sampleSize = 10,
              tParCount = 2,
              mean = 0,
              sigma = 2,
              replicationSize = 10,
              tPar = 0.5
            )
          })
