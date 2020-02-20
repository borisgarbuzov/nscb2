#' @export

test_that(desc = "Testing upperBoundLRVHatNorm
          ",
          code = {
            if(F) #A temporary solution until a function "computeUpperBoundSumNorm" is written
            {testUtilComputeUpperBoundSumNorm(sigma = 1,
                                             sampleSize = 10,
                                             minIndex = -5,
                                             batchSize = 5)
          }}
)
