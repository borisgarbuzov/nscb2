test_that(desc = "Testing  \'ThetaGraphics3d\'",
          code = {
            testUtilSumSqBlockSumsVarUpperBoundGraphics3d(sigma = 0.5,
                                                          batchSizeArray = 10:15,
                                                          minIndex = -5,
                                                          maxIndexArray = 10:15)
          })
