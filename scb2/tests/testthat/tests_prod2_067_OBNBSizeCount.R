test_that(desc = "Testing testUtilOBNBSizeCount",
          code = {

            testUtilOBNBSizeCount(numberInFocus = seq(10,20,10),
                                                     psi = 0.5,
                                                     sigma = 1,
                                                     mean = 0)
          })
