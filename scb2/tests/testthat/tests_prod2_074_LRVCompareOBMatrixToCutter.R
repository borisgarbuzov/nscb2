test_that(desc = "Testing LRVCompareOBMatrixToCutter",
          code = {
            testUtilLRVCompareOBMatrixToCutter(sizeArray = seq(10,30,5),
                                               psi = 0.5,
                                               sigma = 1,
                                               mean = 0)
          })
