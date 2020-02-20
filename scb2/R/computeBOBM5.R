"Функция возвращает bandWidth для пятого сценария"
computeBOBM5 <- function(sampleSize){
  bandWidth <- getBOBMConst5() * sampleSize^(-getBOBMDegree5())
  return(bandWidth)
}
