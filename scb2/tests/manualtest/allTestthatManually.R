library(devtools)
library(testthat)
devtools::load_all()
testsResult <- testthat::source_dir(path = "tests/testthat")

for(testIndex in 1:length(testsResult))
{
  if(testsResult[[testIndex]])
  {
    stop(paste0("In tests have bug. TestIndex is = ",testIndex))
  }
}

