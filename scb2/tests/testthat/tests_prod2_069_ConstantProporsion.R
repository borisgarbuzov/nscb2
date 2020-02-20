test_that(desc = "Testing testUtilOBNBSizeCount",
          code = {
            testUtilOBConstantProporsion(sizeArray = seq(10,30,5),
                                          psi = 0.5,
                                          sigma = 1,
                                          mean = 0,
                                         batchSizeProporsion = 0.2)
          })
