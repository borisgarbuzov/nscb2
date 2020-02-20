test_that(desc = "Testing BenchmarkEstimateWuForCenterdSample",
          code = {
            testUtilBenchmarkEstimateWuForCenterdSample(sizeArray =   seq(10,100,5),
                                                           psi = 0.5,
                                                           sigma = 1,
                                                           mean = 0)
          })
