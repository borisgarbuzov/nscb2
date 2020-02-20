#' @export

test_that(desc = "Testing computeSqareRootBatchSizeUpperBound",
          code = {
             testUtilComputeSqareRootBatchSizeUpperBound(indexArray = (-5:10),
                                                         sigma = 1,
                                                         type = "BlockSum")
          }
)

