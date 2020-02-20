test_that(desc = "Testing  \'thetaTypeDivPower\'",
          code = {
            testUtilThetaTypeDivPower(indexArray = 1:10,
                                      sigma = 0.9,
                                      type1 = "X",
                                      type2 = "X2",
                                      powerArray = linspace(1,2,10),
                                      batchSize = 5)
          })
