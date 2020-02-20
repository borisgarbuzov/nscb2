test_that(desc = "Testitn \'BetaLRVAndBetaLRVHatGrowSize\'",
          code = {
            testUtilBenchmarkBetaLRVAndBetaLRVHat(sizeArray =  seq(5,20,5),
                                                 mean = 1,
                                                 sigma = 0.5,
                                                 psi = 0,
                                                 lag = 3,
                                                 cutOffValue = 4,
                                                 type = "OB",
                                                 times = 1)
          })
