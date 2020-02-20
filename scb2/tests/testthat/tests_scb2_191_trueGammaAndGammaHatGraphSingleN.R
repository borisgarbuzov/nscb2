test_that(desc = "Testing  \'trueGammaAndGammaHatGraphSingleN\'",
          code = {
            testUtilTrueGammaAndGammaHatGraphSingleN(
              sampleSize = 100,
              lag = 1,
              bandWidthPowerForGamma = 1/4,
              sigma = 2,
              tParCount = 11,
              noise = NULL
            )
          })
