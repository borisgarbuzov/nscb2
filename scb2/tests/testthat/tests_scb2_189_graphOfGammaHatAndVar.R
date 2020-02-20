test_that(desc = "Testing  \'graphOfGammaHatAndVar\'",
          code = {
            testUtilGraphOfGammaHatAndVar(
              sampleSize = 10,
              tPar = 0.5,
              tParCount = 2,
              sigma = 2,
              mean = 0,
              lag = 0
            )
          })
