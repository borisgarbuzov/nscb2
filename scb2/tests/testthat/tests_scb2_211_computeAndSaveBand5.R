test_that(desc = "Testing  \'computeAndSaveBand5\'",
          code = {
            testUtilComputeAndSaveBand5(
              sampleSize = 100,
              testSample = NULL,
              tParCount = 11,
              lag = 2,
              sigma = 2,
              mean = 0,
              noise = NULL,
              nonCoverageProbability = 0.2,
              type = "ScaledNoise",
              diagOrHoriz = "diag",
              typeOfKernel = "gaussian",
              isTrueLRV = T,
              factorType = "NRF"
            )
          })
