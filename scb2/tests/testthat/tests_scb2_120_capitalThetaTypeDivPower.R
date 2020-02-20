test_that(desc = "Testing  \'CapitalThetaTypeDivPower\'",
          code = {
            testUtilCapitalThetaTypeDivPower(indexArray = -5:10,
                                             sigma = 0.9,
                                             type1 = "X",
                                             type2 = "X2",
                                             powerArray = linspace(1,2,10))
          })
