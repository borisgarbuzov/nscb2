test_that(desc = "Testing testUtildrawLrvHatVsTSAVsBasePeriodogram",
          code = {
            testUtildrawLrvHatVsTSAVsBasePeriodogram(sizeArray = seq(10,30,5),
                                                     psi = 0.5,
                                                     sigma = 1,
                                                     mean = 0)
          })
