test_that(desc = "Testing  \'computeGammaHat\'",
          code = {
            testUtilComputeGammaHat(
              sample = c(-2, 3.4, 1, 8.54, 2, 12, 9.4, 10, 7.7, 4),
              lag = 0
            )
          })
