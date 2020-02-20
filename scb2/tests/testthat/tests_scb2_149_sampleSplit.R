#' @export
test_that(desc = "Testing  \'sampleSplit\'",
          code = {
            testUtilSampleSplit(sample = c(10,  -7.85,  8.92, 11.65, -10.7, 11) ,
                                batchSize = 3)
          })
