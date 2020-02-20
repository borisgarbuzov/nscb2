test_that(desc = "ComputeQuadraticFormValue ",
          code = {
            testUtilComputeQuadraticFormValue(size = 50,
                                        psi = 0.5,
                                        sigma = 1,
                                        mean = 0,
                                        batchSize = 5)
          }
)
