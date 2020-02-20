test_that(desc = "Testing cutOB",
          code = {
            testUtilDrawWuForCentWithMA(sizeArray = seq(10,30,5),
                                        numberOfExperiment = 5,
                                        psiDepth = 3,
                                        psi = 0.01,
                                        sigma = 1)
          }
)
