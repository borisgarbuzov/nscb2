test_that(desc = "Testing BenchmarkEstimateWuForNonCenterdSample",
          code = {
            testUtilBenchmarkEstimateWuForNonCenterdSample(sizeArray =   seq(10,30,10),
                                                            psi = 0.5,
                                                            sigma = 1,
                                                            mean = 0)
          })
