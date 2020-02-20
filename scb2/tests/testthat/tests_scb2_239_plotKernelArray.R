test_that(desc = "Testing  \'plotKernelArray\'",
          code = {
            testUtilplotKernelArray(
              sampleSize = 10,
              bOBMMin = 0.009,
              bOBMMax = 0.1,
              bOBMStep = 0.01,
              tPar = 0.5
            )
          })