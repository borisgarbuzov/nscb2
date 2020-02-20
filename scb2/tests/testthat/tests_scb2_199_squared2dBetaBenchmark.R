test_that(desc = "Testing  \'squared2dBetaBenchmark\'",
          code = {
            testUtilSquared2dBetaBenchmark(
              minSampleSize = 10,
              maxSampleSize = 100,
              sampleSizeStep = 10
            )})
