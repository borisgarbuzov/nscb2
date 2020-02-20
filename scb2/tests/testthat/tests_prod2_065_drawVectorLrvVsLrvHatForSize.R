test_that(desc = "Testing DrawVectorLrvVsLrvHatForSize ",
          code = {
            testUtilDrawVectorLrvVsLrvHatForSize(sizeArray = seq(10,30,10),
                                          psi = 0.5,
                                          sigma = 1,
                                          mean = 0)
          })
