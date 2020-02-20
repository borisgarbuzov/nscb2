test_that(desc = "Testing  \'computeNonCoverageFreq5\'",
          code = {
            testUtilComputeNonCoverageFreq5(
              replicationCount = 1,
              tParArray = c(0.00, 0.25, 0.50, 0.75, 1.00),
              lag = 2,
              nonCoverageProbability = 0.2,
              parList = list(sampleSize = 10,
                             testSample = NULL,
                             tParCount = 5,
                             sigma = 2,
                             mean = 0,
                             lag = 2,
                             noise = NULL,
                             type = "ScaledNoise",
                             diagOrHoriz = "diag",
                             plotBand = F,
                             isTrueLRV = T,
                             factorType = "NRF")
            )
          })
