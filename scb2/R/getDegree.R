#'@export
# Must be between -0.5 and -0.11111
# bandwidth increases when degree increases
# If I make degree=-0.12, the automatic sampleSize=300 approximately,
# and testthat runs slowly.
# If I make degree=-0.4, the automatic sampleSize=6 approximately,
# and testthat runs fast.
getDegree <- function(degree=-0.26)
{
  #degree <- -0.26
  return(degree)
}
