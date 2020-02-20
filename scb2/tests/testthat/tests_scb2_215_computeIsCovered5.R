test_that(desc = "Testing  \'computeIsCovered5\'",
          code = {
            testUtilComputeIsCovered5(
              band = cbind(c(0.2, 1.2, 0.3, 0.1, 1), c(1.3, 2, 0.4, 0, 5)),
              tParArray = c(0.00, 0.25, 0.50, 0.75, 1.00),
              parList = list(sampleSize = 100,
                             tParCount = 5,
                             lag = 2,
                             type = "ScaledNoise",
                             plotBand = F)
            )
          })
