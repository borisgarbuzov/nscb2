firstIndex = -5
lastIndex = 10
mySigma = 0.9

test_that(desc = "Testing  \'CapitalTheta\'",
          code = {
            testUtilCapitalTheta(indexArray = firstIndex:lastIndex,
                                 sigma = mySigma,
                                 type = "X")

          })
