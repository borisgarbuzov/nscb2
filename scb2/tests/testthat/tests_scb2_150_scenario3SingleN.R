#' @export
test_that(desc = "Testing  \'scenario3SingleN\'",
          code = {
            testUtilScenario3SingleN(tParCount = 11,
                                     sampleSize = 10,
                                     sigma = 2,
                                     pictureWidth = 2000,
                                     pictureHeight = 1000,
                                     isSeed = 42,
                                     typeOfKernel = "gaussian",
                                     noise = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
                                     bDegree = -0.5)
          })
