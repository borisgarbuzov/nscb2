test_that(desc = "Testing  \'computeBetaLrvHat5\'",
          code = {
            testUtilComputeBetaLrvHat5(
              sample = array(data = c(5/4, 12/4, 21/4, 8)),
              lag = 2,
              tParArray = c(0.00, 0.25, 0.50, 0.75, 1.00),
              diagOrHoriz = "diag",
              typeOfKernel = "gaussian"
            )
          })
