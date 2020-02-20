test_that(desc = "Testing testUtilBenchmarkCreateOriginalMA1",
          code = {
            testUtilBenchmarkCreateOriginalMA1(sizeArray = seq(10,20,5),
                                                     psi = 0.5,
                                                     sigma = 1,
                                                     mean = 0)
          })
