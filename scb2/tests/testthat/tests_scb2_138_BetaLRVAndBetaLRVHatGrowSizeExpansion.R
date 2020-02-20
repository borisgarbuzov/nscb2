test_that(desc = "Testitn \'BetaLRVAndBetaLRVHatGrowSizeExpansion\'",
          code = {
            testUtilBetaLRVAndBetaLRVHatSizeExpansion(maxSize =  15,
                                                      sizeIncrement = 2,
                                                      sigma = 0.5,
                                                      lag = 3,
                                                      numberOfTests = 4,
                                                      type = "OB")
          })
