#' @export
#'
#' @importFrom lattice levelplot
testUtilComputeQuadraticFormMatrixFromOB <- function(size,
                                                     batchSize)
{
  cat("\nTesting \'1 tests_19_computeQuadraticFormMatrixFromOB\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("batchSze",batchSize,"\n")
  errorThreshold = 1e-10
  cat("\n errorThreshold =", errorThreshold, "\n")
  cat("=====================\n")

  Start <- Sys.time()
  quadraticFormMatrix <- computeQuadraticFormMatrixFromOB(size=size,batchSize = batchSize)


  # check that the matrix is symmetric a(i,j) = a(j,i), double cycle
  # check that the matrix sums to zero
  cat("Result:\n")
  cat("QuadraticForm =\n")
  print(quadraticFormMatrix[1:5, 1:5])

  quadraticMatrix <- apply(quadraticFormMatrix, 2, rev)
  quadraticMatrix <- t(quadraticMatrix)

  nColQuadrMatrix <- ncol(quadraticMatrix)
  colorSeqAsNumbers <- unique(as.factor(quadraticMatrix))
  lengthColorSeqAsNumbers <- length(colorSeqAsNumbers)

  image(1:nColQuadrMatrix, # x
        1:nColQuadrMatrix, # y
        quadraticMatrix,   # the object
        main = "Quadratic Form Matrix From OB \n",
        sub = paste0("size = ", size, ", batchSize = ", batchSize),
        col = terrain.colors(lengthColorSeqAsNumbers), # color palette
        axes = F)
  axis(2, at = 1:nColQuadrMatrix, labels = nColQuadrMatrix:1)
  axis(3, at = 1:nColQuadrMatrix, labels = 1:nColQuadrMatrix)

  # solution for using lattice::levelplot()

  # print(levelplot(quadraticFormMatrix[1:nColQuadrMatrix, 1:nColQuadrMatrix],
  #                 main = "Quadratic Form Matrix From OB",
  #                 sub = paste0("size = ", size, ", batchSize = ", batchSize),
  #                 xlab = "Size",
  #                 ylab = "Size",
  #                 pretty = T))

    cat("Result is obtained. Now checking it for test conditions. \n")

  isSym = isSymmetric(quadraticFormMatrix)
  if (!isSym)
  {
    stop ("error, should be symmetric")
  }


  cat ("\n isSym = ", isSym, "\n")
  checkSum =
    (rowSums(quadraticFormMatrix))^2 +
    (colSums(quadraticFormMatrix))^2
  checkSum = sum(quadraticFormMatrix)

  cat ("\n checkSum = ", checkSum, "\n")
  if (checkSum > errorThreshold)
  {
    stop ("error, should sum to zero")
  }

  End <- Sys.time()




  duration <- End - Start
  cat("duration = ",duration)

  cat("\n End of test computeQuadraticFormMatrixFromOB")
}
