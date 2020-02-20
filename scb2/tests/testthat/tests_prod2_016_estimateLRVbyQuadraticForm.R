test_that(desc = "Testing estitamateLrvBuQaudraticForm",
          code = {
            testUtilEstimateLRVbyQuadraticForm(size = 10,
                                        psi = 0.5,
                                        sigma = 1,
                                        mean = 0,
                                        batchSize = 5)
          }
)
