# Testing createCMatrix function
# for dimensions of result
test_that(desc = "Testing all \'testUtilCreateCMatrix\'",
          code = {
            testUtilCreateCMatrix(size = 10,
                                  sigma = 1,
                                  psi = 0.5)
            })
