# Testing createCMatrix function
# for dimensions of result

test_that(desc = "Testing createCMatrix for dimensions",
          code = {
            testUtilCreateDMatrix(size = 10,
                                  sigma = 1,
                                  psi = 0.5)
            })
