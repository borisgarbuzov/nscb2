test_that(desc = "Testing  \'ThetaGraphics3d\'",
          code = {
            testUtilLambdaGraphics3d(sigma = 0.5,
                                     index = (-5:10),
                                      batchSizeArray = (1:20))
          })
