#' @export

test_that(desc = "Testing upperBoundLRVHatNorm",
          code = {
            testUtilCreateLambdaArrayForOBiid(indexArray = (-5:15),
                                              sigma = 4,
                                              type = "BlockSum2",
                                              batchSize = 10)

            }
)
