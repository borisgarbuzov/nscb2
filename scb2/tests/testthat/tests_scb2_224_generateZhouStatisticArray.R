test_that(desc = "Testing  \'generateZhouStatisticArray\'",
          code = {
            testUtilGenerateZhouStatisticArray(
              sampleSize = 100,
              tParCount = 10,
              replicationCount = 1,
              parList = NULL,
              isPlot = F
            )
          })
