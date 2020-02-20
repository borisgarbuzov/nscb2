test_that(desc = "Testitn \'BetaLRVAndBetaLRVHat\'",
          code = {
            testUtilBetaLRVAndBetaLRVHat(size = 50,
                                         mean = 1,
                                         sigma = 0.5,
                                         psi = 0,
                                         cutOffValue = 4,
                                         type = "OB")
            })
