betaColumnGraphSingleN <- function(tParCount = 30,
                                   betaColumnElementIndex = 1,
                                    sampleSize = 100,
                                    sigma = 2,
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


  #Получаем начальное значение времени, чтобы в будущем
  #определить, сколько времени потребовалось на работу
  #функции
  startTime <- Sys.time()


  tParArray <- createTParArray(tParCount)

  bandWidth <- computeBOBM(sampleSize, bDegree, bConst = bConst)
  batchSize <- computeBatchSize(sampleSize, mConst)

  sandboxBounds <- createNewTParArrayIndex(tParArray = tParArray,
                                           bandWidth = bandWidth)

  if(renevalOrExpansion == "expansion"){
    diagHorizSamplePair <- createDiagHorSamples(sampleSize,
                                                tParCount, mean = 0, sigma = sigma, noise = NULL,
                                                type = "ScaledNoise")
  }

  #Создаём диагональную и горизонтальную выборку с заданным
  #среднеквадратическим отклонением и текущим sampleSize
  if(renevalOrExpansion == "renewal"){
    diagHorizSamplePair <- createDiagHorSamples(sampleSize, tParCount,
                                                mean = 0, sigma = sigma, noise = NULL,
                                                type = "ScaledNoise")
    diagonalSample <- diagHorizSamplePair[[2]]
    horizontal2dSample <- diagHorizSamplePair[[1]]
  }

  if(renevalOrExpansion == "expansion"){
    diagonalSample <- diagHorizSamplePair[[2]]
    horizontal2dSample <- diagHorizSamplePair[[1]]
    diagonalSample <- diagonalSample[1:sampleSize]
    horizontal2dSample <- horizontal2dSample[,1:sampleSize]
  }

  diagonalBetaColumnArray <- array(data = 0, dim = (sandboxBounds[2] - sandboxBounds[1]))
  horizontalBetaColumnArray <- array(data = 0, dim = (sandboxBounds[2] - sandboxBounds[1]))

  for(tIndex in sandboxBounds[1]:sandboxBounds[2]){
  diagonalBetaColumn <- computeBetaMatrixColumnHat(diagonalSample,
                                                   lag = lag,
                                                   tPar = tParArray[tIndex],
                                                   bDegreeForGamma)
  diagonalBetaColumnArray[(tIndex-sandboxBounds[1]+1)] = diagonalBetaColumn[betaColumnElementIndex]

  "For each option from the sandbox..."


  "Create diagonal Beta Matrix"
  horizontalBetaColumn <- computeBetaMatrixColumnHat(horizontal2dSample[tIndex,],
                                                     lag = lag,
                                                     tPar = tParArray[tIndex],
                                                     bDegreeForGamma)
  horizontalBetaColumnArray[(tIndex-sandboxBounds[1]+1)] = horizontalBetaColumn[betaColumnElementIndex]
  }
  tPar = tParArray[tIndex]
  #Генерируем имя файла-графика, который будет построен
  nameOfFile <- paste0("output/BetaColumnsGraphSingleN", typeOfKernel,
                       ", sampleSize=", sampleSize, ".svg")

  #Строим график, сохраняем в качестве svg-файла
  arraySize <- length(diagonalBetaColumnArray)
  color1Array <- array(data = "blue", dim = arraySize)
  color2Array <- array(data = "red", dim = arraySize)

  svg(nameOfFile)
  plot(x = c(tParArray[sandboxBounds[1]:sandboxBounds[2]], tParArray[sandboxBounds[1]:sandboxBounds[2]]),
       y = c(diagonalBetaColumnArray, horizontalBetaColumnArray),
       col = c(color1Array, color2Array), xlab = "tPar", ylab = "beta Value",
       xlim = c(0, tParArray[length(tParArray)]),
       ylim = c(min(c(diagonalBetaColumnArray,
                      horizontalBetaColumnArray)),
                max(c(diagonalBetaColumnArray,
                      horizontalBetaColumnArray))),
       main = "Graph for beta singleN", pch = 21, bg = c(color1Array, color2Array))
  legend("topright", legend = c("diagonal", "horizontal"),
         col = c("blue", "red"), lty=1:1, cex = 0.8)

  lagLegend <- paste("lag =", lag)
  pointCountLegend <- paste("number of points =", arraySize)
  bDegreeBandWidthLegend <- paste("bDegree =", round(bDegree, 4))
  bandWidthLegend <- paste("b= n^", round(bandWidth, 4))
  bDegreeForGammaLegend <- paste("bDegree for gamma =", round(bandWidth, 4))
  bandWidthForGammaLegend <- paste("b for gamma = n^",
                                   round(computeBForGamma(sampleSize, bDegreeForGamma), 4))
  bConstLegend = paste("B =", bConst)
  maxSampleSizeLegend <- paste("Sample size =", sampleSize)
  if(mySeed != "random"){
    seed <- "seed is const"
  }else{
    seed <- "seed is random"
  }

  endTime <- Sys.time()
  durationHours <- as.integer(floor(difftime(endTime, startTime, units="hours")))
  durationMins <- as.integer(floor(difftime(endTime, startTime, units="mins"))) %% 60
  durationSecs <- as.integer(floor(difftime(endTime, startTime, units="secs"))) %% 60

  durationLegend <- paste0("duration = ", durationHours, ":",
                           durationMins, ":", durationSecs)

  lines(tParArray[sandboxBounds[1]:sandboxBounds[2]], diagonalBetaColumnArray, col = "blue")
  lines(tParArray[sandboxBounds[1]:sandboxBounds[2]], horizontalBetaColumnArray, col = "red")


  legend("topleft", legend = c(lagLegend, pointCountLegend,
                               bDegreeBandWidthLegend, bandWidthLegend,
                               bDegreeForGammaLegend, bandWidthForGammaLegend,
                               bConstLegend,
                               maxSampleSizeLegend,
                               durationLegend,
                               seed),
         cex = 0.8)

  dev.off()
}
