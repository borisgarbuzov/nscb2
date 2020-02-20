test_that(desc = "Testing createOriginalMAInfConstCoef for length",
		  code = {
		    testUtilCreateOriginalMAInfConstCoef(size = 100,
		                                         sigma = 5,
		                                         mean = 10,
		                                         psi = 5,
		                                         psiMaxSize = 200,
		                                         psiIncrement = T)

})
