test_that(desc = "Testing  \'ThetaGraphics2dFixedIndex\'",
          code = {
            testUtilLambdaGraphics2dFixedIndex(sigma = 0.5,
                                                   index = (-5:10),
                                                   batchSizeArray = (1:15))
          })
