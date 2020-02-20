expectedHorizontalSample <- matrix(c(
  1,    2,    3,     4,
  4/3,  8/3,  12/3,  16/3,
  5/3,  10/3, 15/3,  20/3,
  2,    4,    6,     8),
  nrow = 4, ncol = 4, byrow=TRUE)

testUtilTimesTableTest(sampleSize = 4,
                       tParCount = 4,
                       noise = c(1, 2, 3, 4),
                       expectedHorizontalSample = expectedHorizontalSample)
