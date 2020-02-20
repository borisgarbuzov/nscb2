test_that(desc = "Testing benchmarkCreateOriginalMA1Replicated",
          code = {
            testUtilBenchmarkCreateOriginalMA1Replicated(sizeArray = seq(10,20,5),
                                               psi = 0.5,
                                               sigma = 1,
                                               mean = 0)
          })
