test_that(desc = "Testing BenchmarkCutOB",
          code = {
            testUtilBenchmarkCutOB(size =  seq(10,30,5),
                                   psi = 0.5,
                                   sigma = 1,
                                   mean = 0)
          })
