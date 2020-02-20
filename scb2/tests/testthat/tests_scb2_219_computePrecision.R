test_that(desc = "Testing  \'computePrecision\'",
          code = {
            testUtilComputePrecision(
              trueArray = array(data = c(1, 2, 3)),
              hatDoubleArray = array(data = c(1, 2, 3, 4, 5, 6), dim = c(3, 2))
            )
          })
