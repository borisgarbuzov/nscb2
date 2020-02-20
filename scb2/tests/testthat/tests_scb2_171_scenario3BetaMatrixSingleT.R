test_that(desc = "Testing  \'scenario3BetaMatrixSingleT\'",
          code = {
            testUtilScenario3BetaMatrixSingleT(
              tParCount = 10,
              tIndex = 6,
              minSampleSize = 100,
              maxSampleSize = 10000,
              sampleSizeStep = 1000,
              sigma = 2,
              maxLag = 8,
              lag = 2,
              mySeed = "random",
              renevalOrExpansion = "renewal",
              typeOfKernel = "gaussian",
              bDegree = -0.26,
              bConst = 1,
              mConst = 1)
          })
