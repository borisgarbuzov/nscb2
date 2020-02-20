#' @export
test_that(desc = "Testing  \'createListOfSamples\'",
          code = {
            testUtilCreateListOfSamples( sampleSize = 10,
                                         tParCount = 8,
                                         mean = 0,
                                         sd = 0.35)
          })
