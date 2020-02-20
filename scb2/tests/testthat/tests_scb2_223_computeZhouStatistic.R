test_that(desc = "Testing  \'computeZhouStatistic\'",
          code = {
            testUtilComputeZhouStatistic(
              tParCount = 10,
              sample = rnorm(n = 100),
              parList = NULL,
              isPlot = F
            )
          })
