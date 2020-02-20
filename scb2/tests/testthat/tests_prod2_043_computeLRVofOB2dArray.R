test_that(desc = "Testing computeLRVofOB2dArray",
          code = {
            testcomputeLRVofOB2dArray(size = 10,
                          psi = 0.5,
                          sigma = 1,
                          mean = 0,
                          batchSize = 5)
          }
)
