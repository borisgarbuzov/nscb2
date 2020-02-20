test_that(desc = "Testing  \'manualDiagonalSample\'",
          code = {
            testUtilManualDiagonalSample(
              sampleSize = 4,
              tParCount = 5,
              noise = c(1, 2, 3, 4),
              expectedDiagonalSample = array(data = c(5/4, 12/4, 21/4, 8)))
          })
