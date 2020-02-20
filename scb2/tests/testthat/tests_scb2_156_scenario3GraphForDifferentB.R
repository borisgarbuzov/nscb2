#' @export
test_that(desc = "Testing  \'scenario3GraphForDifferentB\'",
          code = {
            testUtilScenario3GraphForDifferentB(
              tParCount = 11,
              tIndex = 6,
              sd = 2,
              sampleSize = 100,
              bArray = seq(0.01, 1, 0.01)
            )
          })
