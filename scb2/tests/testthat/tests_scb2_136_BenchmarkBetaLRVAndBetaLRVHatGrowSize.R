test_that(desc = "Testitn \'BetaLRVAndBetaLRVHatGrowSize\'",
          code = {
            testUtilBenchmarkBetaLRVAndBetaLRVHatGrowSize(maxSize =  seq(10,20,2),
                                                          sizeIncrement = 1,
                                                          mean = 1,
                                                          sigma = 0.5,
                                                          psi = 0,
                                                          lag = 3,
                                                          cutOffValue = 4,
                                                          type = "OB",
                                                          times = 1)
          })
