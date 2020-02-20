test_that(desc = "Testing  \'CapitalThetaTypeDivision\'",
          code = {
            testUtilUpperBoundDivPower(maxIndexArray = 1:10,
                                       sigma = 0.9,
                                       type1 = "X",
                                       type2 = "X2",
                                       powerArray = linspace(1,4,10))
          })
