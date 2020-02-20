#' @export
test_that(desc = "Testing  \'createGammaScaledNoise \'",
          code = {
            testUtilCreateGammaScaledNoise(
              tPar = 0.5,
              sigma = 1,
              lag = 1
            )
          })
