test_that(desc = "Testing  \'ThetaGraphics2dFixedBatchSize\'",
          code = {
            testUtilThetaGraphics2dFixedBatchSize(sigma = 0.5,
                                                  indexArray = (-5:10),
                                                  batchSize = (1:15))
          })
