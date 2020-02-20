test_that(desc = "Testing createDiffDMatrixVsDHatMatrix",
          code = {
            testUtilCreateDiffDMatrixVsDHatMatrix(size = 10,
                                                  psi = 0.5,
                                                  sigma = 1,
                                                  mean = 0)
          })
