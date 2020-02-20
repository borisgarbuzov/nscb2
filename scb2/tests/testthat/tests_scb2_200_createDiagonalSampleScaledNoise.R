test_that(desc = "Testing  \'createDiagonalSample\'",
          code = {
            testUtilCreateDiagonalSampleScaledNoise(
              sampleSize = 10,
              mean = 0,
              sigma = 2,
              noise = NULL
            )
          })
