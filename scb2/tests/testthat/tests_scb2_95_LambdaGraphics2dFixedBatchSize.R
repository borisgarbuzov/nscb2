test_that(desc = "Testing  \'ThetaGraphics2dFixedIndex\'",
          code = {
            testUtilLambdaGraphics2dFixedBatchSize(sigma = 0.5,
                                              index = (-5:10),
                                              batchSize = 5
                                              )
          })
