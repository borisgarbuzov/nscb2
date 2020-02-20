test_that(desc = "Testing  \'sampleSplit\'",
          code = {
            testUtilSampleSplitExpected(
              sample = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
              batchSize = 3,
              expected = c(36, 81, 144, 225, 324, 441, 576, 729, 900, 1089)
            )
          })
