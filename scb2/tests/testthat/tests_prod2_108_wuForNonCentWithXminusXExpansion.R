test_that(desc = "Testing wuForNonCentWithXXExpansion",
          code = {
            testUtilWuForNonCentWithXminusXExpansion(sizeArray = seq(10,30,5),
                                                sd = 0.5,
                                                mu = 1,
                                                numberOfExperiment = 5)
          })
