localLrvArguments <- function(blockCount)
{
  localArguments <- array(dim = blockCount)
  for (blockIndex in 1:blockCount) {
    localArguments[blockIndex] <- blockIndex/blockCount
  }
  return(localArguments)
}
