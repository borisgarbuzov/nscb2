test_that(desc = "Testing cutOB",
          code = {
            testUtilCutOB(size = 10,
                          psi = 0.5,
                          sigma = 1,
                          mean = 0,
                          batchSize = 5)
          }
)
