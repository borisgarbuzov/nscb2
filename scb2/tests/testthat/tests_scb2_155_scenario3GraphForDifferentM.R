#' @export
test_that(desc = "Testing  \'scenario3GraphForDifferentM\'",
          code = {
            testUtilScenario3GraphForDifferentM(
              tParCount = 11,
              tIndex = 5,
              sigma = 2,
              sampleSize = 100,
              mArray = seq(1, 40, 1)
            )
          })
