test_that(desc = "Testing BenchmarkCreateCHatMatrix",
          code = {
            testUtilBenchmarkCreateDHatMatrix(sizeArray = seq(10,20,5),
                                              psi = 0.5,
                                              sigma = 1,
                                              mean = 0,
                                              maxLag=5)
          })
