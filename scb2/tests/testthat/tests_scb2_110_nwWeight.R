test_that(desc = "Testing  \'nwWeight\'",
          code = {
            testUtilNwWeight(arguments = c(0,3,6,9),
                             bandwidth = 0.1,
                             numberOftests = 5)
          })
