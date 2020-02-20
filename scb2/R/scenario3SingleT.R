scenario3SingleT <- function(tParCount = 11,
                             tIndex = 4,
                             sd = 2,
                             minSampleSize = 1000,
                             maxSampleSize = 1000000,
                             sampleSizeStep = 10000,
                             pictureWidth = 3000,
                             pictureHeight = 1500,
                             isSeed = "random",
                             renevalOrExpansion = "renewal",
                             typeOfKernel = "gaussian",
                             bDegree = -0.26,
                             bConst = 1,
                             mConst = 1
                             )
{
  noise = NULL
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

  #Получаем массив sampleSize, для каждого из которых
  #в будущем создадим выборку и найдём горизонтальную
  #и диагональную оценку LRV
  sampleSizeArray = seq(from = minSampleSize, to = maxSampleSize, by = sampleSizeStep)

  #Получаем начальное значение времени, чтобы в будущем
  #определить, сколько времени потребовалось на работу
  #функции
  startTime <- Sys.time()


  tParArray <- createTParArray(tParCount)

  #Находим trueLRV
  trueLrv <- computeTrueLrv(sigma = sd,
                            tPar = tParArray[tIndex])

  #Подготавливаем массивы LRV для диагональной и
  #горизонтальной выборки
  lrvXArray <- array(data = 0, dim = length(sampleSizeArray))
  lrvYArray <- array(data = 0, dim = length(sampleSizeArray))

  if(renevalOrExpansion == "expansion"){
    samples <- createDiagHorSamples(sampleSizeArray[length(sampleSizeArray)],
                                   tParCount, mean = 0, sigma = sd, noise)
  }

  #Далее для каждого sampleSize получим оценку LRV по
  #горизонтальной и диагональной выборке
  for(sampleSize in 1:length(sampleSizeArray)){
    #Рассчитываем для текущего sampleSize b и m, а также
    #сохраняем степени, использованные при рассчёте, чтобы
    #далее использовать их при отображении в легенде
    bandWidth <- computeB(sampleSizeArray[sampleSize], bDegree, bConst)
    bandWidthDegree <- getDegree(bDegree)
    batchSize <- computeBatchSize(sampleSizeArray[sampleSize], mConst)
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
    if(renevalOrExpansion == "renewal"){
      samples <- createDiagHorSamples(sampleSizeArray[sampleSize], tParCount,
                                     mean = 0, sigma = sd, noise)
      diagonalSample <- samples[[2]]
      horizontal2dSample <- samples[[1]]
    }

    if(renevalOrExpansion == "expansion"){
      diagonalSample <- samples[[2]]
      horizontal2dSample <- samples[[1]]
      diagonalSample <- diagonalSample[1:sampleSizeArray[sampleSize]]
      horizontal2dSample <- horizontal2dSample[,1:sampleSizeArray[sampleSize]]
    }

    #Разбиваем диагональную выборку на квадраты блочных сумм
    diagonalSquaredBatchSumArray <- sampleSplit(sample = diagonalSample,
                                                batchSize = batchSize)

    #Находим оцененное LRV для диагональной выборки
    lrvXArray[sampleSize] <- computeKernelLrvHatForSingleTPar(sampleSizeArray[sampleSize]-batchSize+1,
                                                              diagonalSquaredBatchSumArray,
                                                              tParArray[tIndex],
                                                              batchSize,
                                                              bandWidth,
                                                              typeOfKernel)
    #Разбиваем горизонтальную выборку на квадраты блочных сумм
    horizontalSquaredBatchSumArray <- sampleSplit(sample = horizontal2dSample[tIndex,],
                                                  batchSize = batchSize)

    #Находим оцененное LRV для горизонтальной выборки
    lrvYArray[sampleSize] <- computeKernelLrvHatForSingleTPar(sampleSizeArray[sampleSize]-batchSize+1,
                                                              horizontalSquaredBatchSumArray,
                                                              tParArray[tIndex],
                                                              batchSize,
                                                              bandWidth,
                                                              typeOfKernel)

    #Генерируем имя файла-графика, который будет построен
    nameOfFile <- paste0("output/SingleT", typeOfKernel,
                         ", maxSampleSize=", sampleSizeArray[sampleSize], ".svg")

    #Строим график, сохраняем в качестве svg-файла
    createLrvPlotScenario3SingleT(lrvXArray = lrvXArray[1:sampleSize],
                                  lrvYArray = lrvYArray[1:sampleSize],
                                  trueLrv = trueLrv,
                                  sampleSizeArray = sampleSizeArray[1:sampleSize],
                                  fileName = nameOfFile,
                                  tPar = tParArray[tIndex],
                                  bConst = bConst,
                                  mConst = mConst,
                                  b = bandWidth,
                                  m = batchSize,
                                  startTime = startTime,
                                  bandWidthDegree = bandWidthDegree,
                                  batchSizeDegree = batchSizeDegree,
                                  mySeed = seed)

    cat("There are (", length(lrvXArray) - sampleSize,
        ") iterations left until the end of the program\n")
    #cat(lrvXArray[sampleSize], "\n")
    #cat(batchSize, "\n")
  }
}
