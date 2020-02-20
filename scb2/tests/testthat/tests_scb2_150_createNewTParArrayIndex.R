#' @export
test_that(desc = "Testing  \'createNewTParArrayIndex\'",
          code = {
            testUtilCreateNewTParArrayIndex( tParArray =
                          c(0, 0.07, 0.14, 0.21, 0.29, 0.36, 0.43, 0.5,
                            0.57, 0.64, 0.71, 0.79, 0.86, 0.93, 1)  ,
              bandWidth = 0.37)
          })
