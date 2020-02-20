"Функция возвращает batchSize для пятого сценария"
computeBatchSize5 <- function(sampleSize){
  batchSize <- round(getBatchSizeConst5() * sampleSize^getBatchSizeDegree5())
  return(batchSize)
}
