#' @export
test_that(desc = "Testing  \'createLrvPlotScenario3SingleT\'",
          code = {
            testUtilCreateLrvPlotScenario3SingleT(
              lrvXArray = c(2.4, 7.97, 3.73, 2.76, 4.47, 3, 4.3, 2.67, 5.32, 5.79),
              lrvYArray = c(2.02, 7.45, 3.95, 2.7, 4.34, 2.87, 4.16, 2.74, 5.45, 6.09),
              trueLrv = 5.182081,
              sampleSizeArray <- c(10,  20,  30,  40,  50,  60,  70,  80,  90, 100),
              tParArray = c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1),
              bConst = 1,
              mConst = 1,
              bandWidth = 0.1584893,
              batchSize = 2,
              bandWidthDegree = -0.26,
              batchSizeDegree = 0.19,
              mySeed = F)
          })

