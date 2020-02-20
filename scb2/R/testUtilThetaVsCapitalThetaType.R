testUtilThetaVsCapitalThetaType <- function(indexArray,
                                            sigma,
                                            type,
                                            ...)
{
  cat("\nTesting \'tests_scb2_130_ThetaVsCapitalThetaType\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type = ",type,"\n")

  capitalThetaArray <- array(dim = length(indexArray))

  if(grepl("BlockSum+",type))
  {

    capitalThetaArray <- computeCapitalThetaArray(indexArray = indexArray,
                                                  sigma = sigma,
                                                  type = type,
                                                  batchSize=batchSize)
    thetaArray <- computeThetaArray(indexArray = indexArray,
                                    sigma = sigma,
                                    type = type,
                                    batchSize=batchSize)
    subTitle <- paste0("sigma = " , sigma,
                       ", batchSize = ",batchSize,
                       ", ", getPsiString())

  }else{

    capitalThetaArray <- computeCapitalThetaArray(indexArray = indexArray,
                                                  sigma = sigma,
                                                  type = type)
    thetaArray <- computeThetaArray(indexArray = indexArray,
                                    sigma = sigma,
                                    type = type)
    subTitle <- paste0("sigma = " , sigma,
                       ", ", getPsiString())
  }
  fileName <- paste0("theta",type,"andCapitalTheta",type)
  path <- paste0("output/",type,"/ThetaVsCapitalTheta")
  mainTitle <- paste0("theta(",type,") and capitalTheta(",type,")")
  leg <- c(paste0("theta(",type,")"),paste0("capitalTheta(",type,")"))

  saveJpg(fileName = fileName, path = path)
  plot(x = indexArray,y = thetaArray, pch = 20, col = "blue",
       main = mainTitle, sub = subTitle)
  points(x = indexArray,y = capitalThetaArray, pch = 19, col="red")
  legend("topright",col = c("blue","red"),legend = leg,pch = c(20,19))
  graphics.off()

  fileName <- paste0("capitalTheta",type,"DivTheta",type)
  mainTitle <- paste0("theta(",type,") / capitalTheta(",type,")")

  saveJpg(fileName = fileName, path = path)
  plot(x = indexArray,y = thetaArray/capitalThetaArray, pch = 20, col = "blue",
       main = mainTitle, sub = subTitle)
  graphics.off()

  fileName <- paste0("SPTheta",type,"VSCapitalTheta",type)
  mainTitle <- paste0("Scaterplot theta(",type,") VS capitalTheta(",type,")")

  saveJpg(fileName = fileName, path = path)
  plot(x = thetaArray,y = capitalThetaArray, pch = 20,
       main = mainTitle, sub = subTitle)
  graphics.off()

  cat("End of test ThetaVsCapitalThetaType","\n")

  cat("=====================\n")
}
