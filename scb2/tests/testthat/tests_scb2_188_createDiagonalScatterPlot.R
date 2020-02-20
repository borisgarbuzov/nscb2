test_that(desc = "Testing  \'createDiagonalScatterPlot\'",
          code = {
            testUtilCreateDiagonalScatterPlot(
              sampleSize = 10,
              tParCount = 2,
              mean = 0,
              sigma = 2,
              replicationSize = 10
            )
          })
