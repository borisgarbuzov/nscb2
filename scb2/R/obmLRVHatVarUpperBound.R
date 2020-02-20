obmLRVHatVarUpperBound <- function(sigma,
                                   maxIndex,
                                   minIndex,
                                   batchSize)
{
  indexArray <- minIndex:(maxIndex-batchSize)
  computedLRVHat <- computeUpperBound(indexArray = indexArray,
                                      sigma = sigma,
                                      type = "MA1BlockSum",
                                      batchSize)
  computedLRVHat <- computedLRVHat/((maxIndex - batchSize + 1)*batchSize)^2
}
