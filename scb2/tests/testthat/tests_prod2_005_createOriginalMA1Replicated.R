test_that(desc = "Testing createOriginal for length",
          code = {
            testUtilCreateOriginalMA1Replicated(replicationCount = 10,
                                                size = 10,
                                                psi = 0.5,
                                                sigma = 1,
                                                mean = 0)
          })
