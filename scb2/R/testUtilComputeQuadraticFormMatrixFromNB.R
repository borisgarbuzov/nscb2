#' @export
#'
#' @importFrom lattice levelplot
testUtilComputeQuadraticFormMatrixFromNB <- function(size,
                                        batchSize)
{
  cat("\nTesting \'tests_17_computeQuadraticFormMatrixFromNB\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("batchSze",batchSize,"\n")
  errorThreshold = 1e-10
  cat("\n errorThreshold =", errorThreshold, "\n")
  cat("=====================\n")


  Start <- Sys.time()
  quadraticFormMatrix <- computeQuadraticFormMatrixFromNB(size=size,batchSize = batchSize)
  End <- Sys.time()

  cat("Result:\n")


  cat("QuadraticForm =\n")
  print(quadraticFormMatrix[1:3, 1:3])
  # image(quadraticMatrix, axes=T)
  # mplot::mplot(quadraticMatrix)
  # mtext(text=c(size:1), side=2, line=0.3, at=seq(0.005,1,1/size), las=1, cex=0.8)
  # mtext(text=c(1:size), side=1, line=0.3, at=seq(0.005,1,1/size), las=1, cex=0.8)
  quadraticMatrix <- apply(quadraticFormMatrix, 2, rev)
  # perhaps we do not need transposition
  # quadraticMatrix <- t(quadraticMatrix)

  # https://stackoverflow.com/questions/6886990/how-to-easily-visualize-a-matrix

  nColQuadrMatrix <- ncol(quadraticMatrix)
  colorSeqAsNumbers <- unique(as.factor(quadraticMatrix))
  lengthColorSeqAsNumbers <- length(colorSeqAsNumbers)

  image(1:nColQuadrMatrix, # x
        1:nColQuadrMatrix, # y
        quadraticMatrix,   # the object
        main = "Quadratic Form Matrix From NB \n \n",
        sub = paste0("size = ", size, ", batchSize = ", batchSize),
        col = terrain.colors(lengthColorSeqAsNumbers), # color palette
        axes = F)
  axis(2, at = 1:nColQuadrMatrix, labels = nColQuadrMatrix:1)
  axis(3, at = 1:nColQuadrMatrix, labels = 1:nColQuadrMatrix)

  # solution for using lattice::levelplot()
  # print(levelplot(quadraticMatrix[1:nColQuadrMatrix, 1:nColQuadrMatrix],
  #           main = "Quadratic Form Matrix From NB",
  #           sub = paste0("size = ", size, ", batchSize = ", batchSize),
  #           xlab = "Size",
  #           ylab = "Size",
  #           pretty = T))
  cat("Result is obtained. Now checking it for test conditions. \n")

  isSym = isSymmetric(quadraticMatrix)
  if (!isSym)
  {
    stop ("error, should be symmetric")
  }


  cat ("\n isSym = ", isSym, "\n")
  totalSum = sum(quadraticMatrix)

  cat ("\n totalSum = ", totalSum, "\n")
  if (abs(totalSum) > errorThreshold)
  {
    stop ("error, should sum to zero")
  }

  duration <- End - Start
  cat("duration = ", duration)

  cat("\n End of test computeQuadraticFormMatrixFromNB")
}

