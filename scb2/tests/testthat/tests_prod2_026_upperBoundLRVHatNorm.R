#' @export

test_that(desc = "Testing upperBoundLRVHatNorm",
          code = {
            testUtilUpperBoundLRVHatNorm(indexArray = (-5:10),
                                         sigma = 1,
                                         type = "BlockSum",
                                         batchSize = 5)
            }
)
