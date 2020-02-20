scenario4BetaSingleT <- function(tParCount = 11,
                                 tIndex = 6,
                                 minSampleSize = 1000,
                                 maxSampleSize = 7000,
                                 sampleSizeStep = 3000,
                                 sigma = 2,
                                 maxLag = 8,
                                 lag = 2,
                                 pictureWidth = 2000,
                                 pictureHeight = 1000,
                                 mySeed = "random",
                                 renevalOrExpansion = "renewal",
                                 typeOfKernel = "gaussian",
                                 bDegree = 1/13,
                                 bConst = 0.1,
                                 mConst = 1,
                                 bDegreeForGamma = 1/4)
{
  "Check if this directory exists"
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  "Set a logical variable to display whether the seed is fixed or not in the legend"
  if(mySeed == "random"){
    set.seed(NULL)
    seed <- F
  }else{
    set.seed(mySeed)
    seed <- T
  }

  "Fix the beginning of calculations to show
  on the chart how much time it took for the program to work"
  startTime <- Sys.time()

  sampleSizeArray = seq(from = minSampleSize, to = maxSampleSize, by = sampleSizeStep)

  #Получаем начальное значение времени, чтобы в будущем
  #определить, сколько времени потребовалось на работу
  #функции
  startTime <- Sys.time()


  tParArray <- createTParArray(tParCount)

  #Находим trueLRV
  trueLrv <- computeTrueBetaLrv(sigma = sigma,
                            tPar = tParArray[tIndex],
                            type = "ScaledNoise")


  #Подготавливаем массивы LRV для диагональной и
  #горизонтальной выборки
  diagonalLrvArray <- array(data = 0, dim = length(sampleSizeArray))
  horizontalLrvArray <- array(data = 0, dim = length(sampleSizeArray))

  if(renevalOrExpansion == "expansion"){
    diagHorizSamplePair <- createDiagHorSamples(sampleSizeArray[length(sampleSizeArray)],
                                    tParCount, mean = 0, sigma = sigma, noise = NULL,
                                    type = "ScaledNoise")
  }

  #Далее для каждого sampleSize получим оценку LRV по
  #горизонтальной и диагональной выборке
  for(sampleSize in 1:length(sampleSizeArray)){
    #Рассчитываем для текущего sampleSize b и m, а также
    #сохраняем степени, использованные при рассчёте, чтобы
    #далее использовать их при отображении в легенде
    bandWidth <- computeBOBM(sampleSizeArray[sampleSize], bDegree, bConst = bConst)
    bandWidthDegree <- bDegree
    batchSize <- computeBatchSize(sampleSizeArray[sampleSize], mConst)
    batchSizeDegree <- getDegreeForBatchSize()


    if((tParArray[tIndex] < bandWidth) | (tParArray[tIndex] > 1-bandWidth)){
      cat("Error: The selected t is outside the 'sandbox'. ")
      return(NULL)
    }

    #Создаём диагональную и горизонтальную выборку с заданным
    #среднеквадратическим отклонением и текущим sampleSize
    if(renevalOrExpansion == "renewal"){
      diagHorizSamplePair <- createDiagHorSamples(sampleSizeArray[sampleSize], tParCount,
                                      mean = 0, sigma = sigma, noise = NULL,
                                      type = "ScaledNoise")
      diagonalSample <- diagHorizSamplePair[[2]]
      horizontal2dSample <- diagHorizSamplePair[[1]]
    }

    if(renevalOrExpansion == "expansion"){
      diagonalSample <- diagHorizSamplePair[[2]]
      horizontal2dSample <- diagHorizSamplePair[[1]]
      diagonalSample <- diagonalSample[1:sampleSizeArray[sampleSize]]
      horizontal2dSample <- horizontal2dSample[,1:sampleSizeArray[sampleSize]]
    }

    diagonalBetaColumn <- computeBetaMatrixColumnHat(diagonalSample,
                                            lag = lag,
                                            tPar = tParArray[tIndex],
                                            bDegreeForGamma)

    diagonalSquaredBatchSumArray <- sampleSplit(sample = diagonalBetaColumn,
                                                batchSize = batchSize)

    newSampleSize <- length(diagonalSquaredBatchSumArray)

    "Calculate the LRV for the diagonal sample"
    diagonalLrvArray[sampleSize] <- computeKernelLrvHatForSingleTPar(newSampleSize,
                                                                    diagonalSquaredBatchSumArray,
                                                                    tParArray[tIndex],
                                                                    batchSize,
                                                                    bandWidth,
                                                                    typeOfKernel)

    "Create diagonal Beta Matrix"
    horizontalBetaColumn <- computeBetaMatrixColumnHat(horizontal2dSample[tIndex,],
                                                       lag = lag,
                                                       tPar = tParArray[tIndex],
                                                       bDegreeForGamma)

    "Calculate the squares of the block sums of the horizontal sample"
    horizontalSquaredBatchSumArray <- sampleSplit(sample = horizontalBetaColumn,
                                                  batchSize = batchSize)

    newSampleSize <- length(horizontalSquaredBatchSumArray)

    "Calculate the LRV for the horizontal sample"
    horizontalLrvArray[sampleSize] <- computeKernelLrvHatForSingleTPar(newSampleSize,
                                                                      horizontalSquaredBatchSumArray,
                                                                      tParArray[tIndex],
                                                                      batchSize,
                                                                      bandWidth,
                                                                      typeOfKernel)
    cat("horizontal LRV = ", horizontalLrvArray[sampleSize], "\n")


    #Генерируем имя файла-графика, который будет построен
    nameOfFile <- paste0("output/SingleT", typeOfKernel,
                         ", maxSampleSize=", sampleSizeArray[sampleSize], ".svg")

    #Строим график, сохраняем в качестве svg-файла
    createLrvPlotScenario4SingleT(lrvXArray = diagonalLrvArray[1:sampleSize],
                                  lrvYArray = horizontalLrvArray[1:sampleSize],
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
                                  mySeed = seed,
                                  lag = lag)

    cat("There are (", length(diagonalLrvArray) - sampleSize,
        ") iterations left until the end of the program\n")
    #cat(lrvXArray[sampleSize], "\n")
    #cat(batchSize, "\n")
  }
}
