test_that(desc = "testUtilRenewalVSExpansion",
          code = {testUtilSavePlotWu2009EstimateLRV(batchSize = seq(20,25,1),
                                                     psi = 0.5,
                                                     sigma = 1,
                                                     mean = 0)}
)
