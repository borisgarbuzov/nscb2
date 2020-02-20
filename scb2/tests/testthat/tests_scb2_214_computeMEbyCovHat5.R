test_that(desc = "Testing  \'computeMEbyCovHat5\'",
          code = {
            testUtilComputeMEbyCovHat5(
              tParArray = c(0.00, 0.25, 0.50, 0.75, 1.00),
              lag = 2,
              sample = array(data = c(5/4, 12/4, 21/4, 8)),
              nonCoverageProbability = 0.2,
              diagOrHoriz = "diag",
              typeOfKernel = "gaussian"
            )
          })
