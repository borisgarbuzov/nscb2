test_that(desc = "Testing  \'ThetaGraphics3d\'",
          code = {
            testUtilThetaGraphics3d(sigma = 0.5,
                                    indexArray = (-5:45),
                                    batchSize = (1:50))
          })
