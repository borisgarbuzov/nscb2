test_that(desc = "Testing  \'computeAndSaveNonCoverageFreq\'",
          code = {
            testUtilComputeAndSaveNonCoverageFreq(
              sampleSize = 10,
              tParCount = 11,
              lag = 2,
              replicationCount = 1,
              nonCoverageProbabilities = c(0.1),
              sigma = 2,
              mean = 0,
              noise = NULL,
              type = "ScaledNoise",
              diagOrHoriz = "diag",
              plotBand = F,
              isTrueLRV = T,
              factorType = "NRF"
            )
          })
