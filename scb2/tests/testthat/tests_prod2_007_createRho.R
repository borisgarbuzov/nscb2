# Testing createCMatrix function
# for dimensions of result

test_that(desc = "Testing createRho",
          code = {
            testUtilCreateRho(size = 10,
                              psi = 0.5)
            }
          )
