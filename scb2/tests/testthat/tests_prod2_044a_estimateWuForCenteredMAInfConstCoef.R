test_that(desc = "Testing EstimateWuForCenteredMAInfConstCoef",
          code = {
            testUtilEstimateWuForCenteredMAInfConstCoef(size = 100,
                                                        psi = 0.5,
                                                        psiMaxSize = 200,
                                                        sigma = 1,
                                                        mean = 0)
            }
          )
