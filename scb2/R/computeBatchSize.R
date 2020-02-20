computeBatchSize <- function(sampleSize, mConst = 1)
{
  if(mConst != 1){
    warning("The value of the multiplicative constant M must be 1 for stable work")
  }

  degree <- getDegreeForBatchSize()
  #batchSize <- round(getBatchSizeScaleConstant() * sampleSize^degree)
  batchSize <- round(mConst * sampleSize^degree)
  return(batchSize)
}
