test_that(desc = "Testing  \'testUtilNonrandomUniformQuantileCrossValidationTest\'",
          code = {
            testUtilNonrandomUniformQuantileCrossValidationTest(
              sample1 = seq(from=1, to = 10, length.out = 20),
              sample2 = seq(from=1, to = 10, length.out = 21),
              p = 0.95
            )
          })
