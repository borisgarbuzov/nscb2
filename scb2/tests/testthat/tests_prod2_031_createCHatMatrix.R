# Testing createCHatMatrix function
# for dimensions of result

test_that(desc = "Testing createCHatMatrix for dimensions",
          code = {
            testUtilCreateCHatMatrix(size = 10,
                                     psi = 0.5,
                                     sigma = 1,
                                     mean = 0)
            })
