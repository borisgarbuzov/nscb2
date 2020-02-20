test_that(desc = "Testing  \'createBandsBrick5\'",
          code = {
            testUtilCreateBandsBrick5(
              replicationCount = 1,
              tParCount = 11,
              lag = 2,
              nonCoverageProbability = 0.2,
              parList = list(sampleSize = 10,
                             testSample = NULL,
                             sigma = 2,
                             mean = 0,
                             noise = NULL,
                             type = "ScaledNoise",
                             diagOrHoriz = "diag",
                             isTrueLRV = T,
                             factorType = "NRF")
            )
          })
