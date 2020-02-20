"Функция возвращает bCov для пятого сценария"
computeBCov5 <- function(sampleSize){
  bCov <- getBCovConst5() * sampleSize^(-getBCovDegree5())
  return(bCov)
}
