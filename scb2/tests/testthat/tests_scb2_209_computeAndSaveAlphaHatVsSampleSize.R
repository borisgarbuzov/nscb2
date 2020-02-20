test_that(desc = "Testing  \'computeAndSaveAlphaHatVsSampleSize\'",
          code = {
            testUtilComputeAndSaveAlphaHatVsSampleSize(
              minSampleSize = 10,
              maxSampleSize = 20,
              sampleSizeStep = 10,
              tParCount = 11,
              lag = 1,
              replicationCount = 1,
              nonCoverageProbability = 0.5,
              sigma = 2,
              mean = 0,
              noise = NULL,
              type = "ScaledNoise",
              diagOrHoriz = "diag",
              plotBand = F
            )
          })
