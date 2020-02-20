test_that(desc = "Testing BenchmarkComputeLRVOfOB2dArray",
          code = {
            testUtilBenchmarkComputeLRVofOB2dArray(size =  seq(10,30,5),
                                                   psi = 0.5,
                                                   sigma = 1,
                                                   mean = 0)
          })
