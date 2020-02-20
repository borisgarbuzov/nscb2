#' @export
test_that(desc = "Testing  \'computeKernelLrvHat\'",
          code = {
            testUtilComputeKernelLrvHat(
              squaredBatchSumArray =  c(4, 7, 6, 15, 21, 10, 4, 8),
              kernelArray = c(0.07, 0.14, 0.25, 0.36, 0.40, 0.36, 0.25, 0.14),
              sampleSize = 10,
              batchSize = 3
            )
          })
