test_that(desc = "Testing BenchmarkCreateDMatrix",
          code = {
            testUtilBenchmarkCreateDMatrix(sizeArray = seq(10,20,5),
                                           psi = 0.5,
                                           sigma = 1,
                                           mean = 0)
          })
