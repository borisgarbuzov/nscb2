test_that(desc = "Testing  \'computeCovHatWithSeparateB\'",
          code = {
            testUtilComputeCovHatWithSeparateB(
              tPar = 3,
              sample = c(2, 5.12, -21.2, 14, 8.5, 6, 0.7, 9, 4.2, 3),
              lag = 2,
              bandWidth = 1/13
            )
          })
