#' @export
test_that(desc = "Testing  \'computeKenrelLrvHatForSingleTPar\'",
          code = {
            testUtilComputeKenrelLrvHatForSingleTPar(
                                sampleSize = 10,
                                squaredBatchSumArray = c(4, 7, 6, 15, 21, 10, 4),
                                tPar = 0.5,
                                batchSize = 3,
                                bandWidth = 0.27
                                )
          })
