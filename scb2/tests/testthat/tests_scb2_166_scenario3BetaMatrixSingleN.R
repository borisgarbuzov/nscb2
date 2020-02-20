#' @export
test_that(desc = "Testing  \'scenario3BetaMatrixSingleN\'",
          code = {
            testUtilScenario3BetaMatrixSingleN(
              tParCount = 10,
              sampleSize = 100,
              sigma = 2,
              maxLag = 8,
              lag = 2,
              mySeed = "random",
              typeOfKernel = "gaussian",
              bDegree = -0.26,
              bConst = 1,
              mConst = 1
            )
          })
