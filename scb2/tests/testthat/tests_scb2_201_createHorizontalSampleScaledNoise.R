test_that(desc = "Testing  \'createHorizontalSample\'",
          code = {
            testUtilCreateHorizontalSampleScaledNoise(
              sampleSize = 5,
              tParCount = 3,
              mean = 0,
              sigma = 2,
              noise = NULL
            )
          })
