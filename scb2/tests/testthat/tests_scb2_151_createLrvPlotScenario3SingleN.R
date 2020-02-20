#' @export
test_that(desc = "Testing  \'createLrvPlotScenario3SingleN\'",
          code = {
            testUtilCreateLrvPlotScenario3SingleN(
              lrvXArray = c(2.98,  3.5, 3.9),
              lrvYArray = c(2.572, 3.149, 3.68),
              newTParArrayIndex = c(5, 7),
              trueLrvArray = c( 5.557673, 5.917702, 6.258570),
              sampleSize = 10,
              tParArray = c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1),
              bandWidth =  0.3981072,
              batchSize = 1,
              bandWidthDegree = -0.26,
              batchSizeDegree = 0.19,
              mySeed = T,
              bConst = 1,
              mConst = 1
            )
          })
