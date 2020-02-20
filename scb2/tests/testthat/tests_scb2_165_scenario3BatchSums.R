#' @export
test_that(desc = "Testing  \'scenario3BatchSums\'",
          code = {
            testUtilScenario3BatchSums(
              tParCount = 10,
              sampleSize = 100,
              sigma = 2,
              isSeed = "random",
              typeOfKernel = "gaussian",
              noise = NULL,
              bDegree = -0.26
            )
          })
