test_that(desc = "Testing drawVectorLrvVsLrvHat",
          code = {
            testUtilDrawVectorLrvVsLrvHat(size = 10,
                                          psi = 0.5,
                                          sigma = 1,
                                          mean = 0,
                                          lrvHatCount = 5)
          })
