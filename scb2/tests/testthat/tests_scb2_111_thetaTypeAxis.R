test_that(desc = "Testing  \'thetaTypeAxis\'",
          code = {
            testUtilThetaTypeAxis(indexArray = -5:10,
                                  sigma = 0.9,
                                  type1 = "X",
                                  type2 = "X2",
                                  batchSize = 5)
          })
