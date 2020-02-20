test_that(desc = "Testing  \'SumSqBlockSumsVarUpperBoundGraphics2dCurvilinear\'",
          code = {
            testUtilSumSqBlockSumsVarUpperBoundGraphics2dCurvilinear(sigma = 0.5,
                                                                    minIndex = -5,
                                                                    maxIndexArray = seq(30,60,10))
          })
