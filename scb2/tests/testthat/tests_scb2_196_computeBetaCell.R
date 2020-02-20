test_that(desc = "Testing  \'computeBetaCell\'",
          code = {
            testUtilComputeBetaCell(
              sampleElement = 4,
              sampleElementPlusLag = 6,
              rhoHat = 1,
              gammaHat0 = 1,
              expected = 8
          )})
