#' @export
test_that(desc = "Testing  \'computeKenrelArray\'",
          code = {
            testUtilComputeKenrelArray(sampleSize = 10,
                                       tPar = 0.5,
                                       bandWidth = 0.27
                                       )
          })
