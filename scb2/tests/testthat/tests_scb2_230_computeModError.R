test_that(desc = "Testing  \'computeModError\'",
          code = {
            testUtilComputeModError(
              trueRhoArray = c(1,1,1,1,1),
              trueBetaLrvArray = c(2,2,2,2,2),
              rhoHatArray = c(3,3,3,3,3)
            )
          })
