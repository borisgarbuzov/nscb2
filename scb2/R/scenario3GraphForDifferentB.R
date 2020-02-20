scenario3GraphForDifferentB <- function(tParCount = 11,
                                        tIndex = 4,
                                        sd = 2,
                                        sampleSize = 1000,
                                        pictureWidth = 3000,
                                        pictureHeight = 1500,
                                        isSeed = "random",
                                        renevalOrExpansion = "renewal",
                                        typeOfKernel = "gaussian",
                                        bDegree = -0.26,
                                        bArray = seq(0.01, 2, 0.01),
                                        nameOfFile = "output/DifferentB")
{ noise = NULL
#Проверяем, существует ли папка output. Если нет, то создаём
if(!dir.exists("output"))
{
  dir.create("output",recursive = TRUE)
}

#Определяем, зафиксировано семя или нет,
#чтобы потом отобразить это в легенде на графике
if(isSeed == "random"){
  set.seed(NULL)
  seed <- F
}else{
  set.seed(isSeed)
  seed <- T
}


startTime <- Sys.time()


tParArray <- createTParArray(tParCount)

#Находим trueLRV

#Подготавливаем массивы LRV для диагональной и
#горизонтальной выборки
lrvXArray <- array(data = 0, dim = length(bArray))
lrvYArray <- array(data = 0, dim = length(bArray))
trueLrvArray <- array(data = 0, dim = length(bArray))

samples <- createDiagHorSamples(sampleSize,
                               tParCount, mean = 0, sigma = sd, noise)


#Далее для каждого sampleSize получим оценку LRV по
#горизонтальной и диагональной выборке
for(b in 1:length(bArray)){
  trueLrvArray[b] <- computeTrueLrv(sigma = sd,
                                    tPar = tParArray[tIndex])
  #Рассчитываем для текущего sampleSize b и m, а также
  #сохраняем степени, использованные при рассчёте, чтобы
  #далее использовать их при отображении в легенде
  bandWidth <- computeB(sampleSize, bDegree, bConst = bArray[b])
  bandWidthDegree <- getDegree(bDegree)
  batchSize <- round(getBatchSizeScaleConstant() * sampleSize^getDegreeForBatchSize())
  batchSizeDegree <- getDegreeForBatchSize()

  "Take the constants by which b and m"
  bConst <- getScaleConstant()
  mConst <- getBatchSizeScaleConstant()

  if((tParArray[tIndex] < bandWidth) | (tParArray[tIndex] > 1-bandWidth)){
    cat("Error: The selected t is outside the 'sandbox'. ")
    return(NULL)
  }

  #Создаём диагональную и горизонтальную выборку с заданным
  #среднеквадратическим отклонением и текущим sampleSize
  diagonalSample <- samples[[2]]
  horizontal2dSample <- samples[[1]]


  #Разбиваем диагональную выборку на квадраты блочных сумм
  diagonalSquaredBatchSubArray <- sampleSplit(sample = diagonalSample,
                                              batchSize = batchSize)

  #Находим оцененное LRV для диагональной выборки
  lrvXArray[b] <- computeKernelLrvHatForSingleTPar(sampleSize-batchSize+1,
                                                   diagonalSquaredBatchSubArray,
                                                   tParArray[tIndex],
                                                   batchSize,
                                                   bandWidth,
                                                   typeOfKernel)
  #Разбиваем горизонтальную выборку на квадраты блочных сумм
  horizontalSquaredBatchSubArray <- sampleSplit(sample = horizontal2dSample[tIndex,],
                                                batchSize = batchSize)

  #Находим оцененное LRV для горизонтальной выборки
  lrvYArray[b] <- computeKernelLrvHatForSingleTPar(sampleSize-batchSize+1,
                                                   horizontalSquaredBatchSubArray,
                                                   tParArray[tIndex],
                                                   batchSize,
                                                   bandWidth,
                                                   typeOfKernel)


  #Строим график, сохраняем в качестве svg-файла
  arraySize <- length(lrvXArray[1:b])
  color1Array <- array(data = "blue", dim = arraySize)
  color2Array <- array(data = "red", dim = arraySize)
  color3Array <- array(data = "black", dim = arraySize)

  svg(nameOfFile)
  plot(x = c(bArray, bArray, bArray), y = c(lrvXArray, lrvYArray, trueLrvArray),
       col = c(color1Array, color2Array, color3Array), xlab = "B", ylab = "LRV",
       xlim = c(0, max(bArray)), ylim = c(0, max(c(lrvXArray, lrvYArray, trueLrvArray))),
       main = "Graph for single-n-single-t", pch = 21, bg = c(color1Array, color2Array, color3Array))

  legend("bottomright",
         legend = c("true LRV", "diagonal", "horizontal"),
         col = c("black", "blue", "red"), lty=1:1, cex = 0.8)

  sampleSizeLegend <- paste("Sample size =", sampleSize)
  pointCountLegend <- paste("number of points =", arraySize)
  lastBandWidthLegend <- paste("b =", round(bandWidth, 4))
  lastbatchSizeLegend <- paste("m =", batchSize)
  bandWidthLegend <- paste("b = B * n^", bandWidthDegree)
  batchSizeLegend <- paste("m = M * n^", batchSizeDegree)
  bConst = paste("B =", bConst)
  mConst = paste("M =", mConst)

  endTime <- Sys.time()
  durationHours <- as.integer(floor(difftime(endTime, startTime, units="hours")))
  durationMins <- as.integer(floor(difftime(endTime, startTime, units="mins"))) %% 60
  durationSecs <- as.integer(floor(difftime(endTime, startTime, units="secs"))) %% 60

  durationLegend <- paste0("duration = ", durationHours, ":",
                           durationMins, ":", durationSecs)

  legend("bottomleft",
         legend = c(sampleSizeLegend, pointCountLegend,
                    bandWidthLegend, batchSizeLegend,
                    bConst, mConst,
                    lastBandWidthLegend, lastbatchSizeLegend,
                    durationLegend),
         cex = 0.8)

  dev.off()

  cat("There are (", length(lrvXArray) - b,
      ") iterations left until the end of the program\n")
}

}
