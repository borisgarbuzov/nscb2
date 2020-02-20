test_that(desc = "Testing createBetaArray",
          code = {
            testUtilCreateBetaArray(size = 5,
                                    psi = 0.5,
                                    sigma = 1,
                                    mean = 0,
                                    maxLag = 3)
})

