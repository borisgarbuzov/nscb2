"Функция возвращает bCov для margin of error"
computeBCovForME5 <- function(sampleSize){
  bCov <- getBCovConstForME5() * sampleSize^(-getBCovDegree5())
  return(bCov)
}
