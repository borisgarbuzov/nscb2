test_that(desc = "Testing createBetaArrayReplicated",
          code = {
            testUtilCreateBetaArrayReplicated(replicationCount = 10,
                                              size = 10,
                                              psi = 0.5,
                                              sigma = 1,
                                              mean = 0)
})

