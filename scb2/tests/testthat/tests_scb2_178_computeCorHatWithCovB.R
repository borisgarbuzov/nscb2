test_that(desc = "Testing  \'computeCorHatWithCovB\'",
          code = {
            testUtilComputeCorHatWithCovB(
              sample = c(2, 8, 1, -1.3, 4, 6.31, -0.21, 5, 1.21, 10),
              lag = 2,
              tPar = 8,
              bCov = 1 / 4
            )
          })
