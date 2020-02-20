createBlockSample <- function(sampleSize,
                              blockCount)
{
  blockArray <- linspace(1,sampleSize,blockCount+1)
  sample <- createSample(sampleSize = sampleSize+1)
  firstIndexBlock <- 1
  sampleBlockMatrix <- matrix(nrow = blockCount, ncol = (blockArray[2]-blockArray[1]+1))
  for (lastBlockIndex in 2:(blockCount+1)) {
    sampleBlockMatrix[firstIndexBlock,]<-sample[blockArray[firstIndexBlock]:blockArray[lastBlockIndex]]
    firstIndexBlock<-lastBlockIndex
  }
  return(sampleBlockMatrix)
}
