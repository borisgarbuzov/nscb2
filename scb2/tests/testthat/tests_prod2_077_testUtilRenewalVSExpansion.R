test_that(desc = "testUtilRenewalVSExpansion",
          code = {testUtilRenewalVSExpansion(batchSizeArray  = seq(20,25,1),
                                             psi = 0.5,
                                             sigma = 1,
                                             mean = 0,
                                             type = "OB")}
)
test_that(desc = "testUtilRenewalVSExpansion",
          code = {testUtilRenewalVSExpansion(batchSizeArray  = seq(20,25,1),
                                             psi = 0.5,
                                             sigma = 1,
                                             mean = 0,
                                             type = "NB")}
)
