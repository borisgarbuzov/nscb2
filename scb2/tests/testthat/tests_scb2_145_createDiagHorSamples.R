#' @export
test_that(desc = "Testing  \'createDiagHorSamples\'",
          code = {
            testUtilCreateDiagHorSamples( sampleSize = 10,
                                         tParCount = 8,
                                         mean = 0,
                                         sigma = 0.35)
          })
