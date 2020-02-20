test_that(desc = "Testing  \'computeCovHatWithCovB\'",
          code = {
            testUtilComputeCovHatWithCovB(
              tPar = 4,
              sample = c(-2, 3.4, 1, 8.54, 2, 12, 9.4, 10, 7.7, 4),
              lag = 3,
              bCov = 1 / 4
            )
          })
