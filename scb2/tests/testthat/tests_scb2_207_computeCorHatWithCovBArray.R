test_that(desc = "Testing  \'computeCorHatWithCovBArray\'",
          code = {
            testUtilComputeCorHatWithCovBArray(
              tParArray = c(0, 0.25, 0.5, 0.75, 1),
              sample = c(2, 3, 4, 5, 6),
              lag = 2,
              diagOrHoriz = "diag"
            )
          })
