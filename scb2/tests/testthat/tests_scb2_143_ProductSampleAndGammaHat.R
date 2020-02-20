test_that(desc = "Testing  \'BetaNonRadomOriginalI\'",
          code = {
            testUtilProductSampleAndGammaHat(size = 20,
                                             sigma = 1,
                                             mean = 3,
                                             psi = 4,
                                             tParCount = 50,
                                             lag = 3)
          }
)
