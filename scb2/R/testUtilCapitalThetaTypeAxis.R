testUtilCapitalThetaTypeAxis <- function(indexArray,
                                         sigma,
                                         type1,
                                         type2,
                                         ...)
{
  cat("\nTesting \'tests_scb2_117_capitalThetaTypeAxis\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type1 = ",type1,"\n")
  cat("type2 = ",type2,"\n")

  if(grepl("BlockSum+",type1))
  {
    capitalThetaArrayType1 <- computeCapitalThetaArray(indexArray = indexArray,
                                                       sigma = sigma,
                                                       type = type1,
                                                       batchSize = batchSize)

    subTitleType1 <- paste0("sigma = " , sigma,
                            ", ",getPsiString(),
                            ", batchSize = ",batchSize)


  }else{
    capitalThetaArrayType1 <- computeCapitalThetaArray(indexArray = indexArray,
                                                       sigma = sigma,
                                                       type = type1)
    subTitleType1 <- paste0( "sigma = " , sigma,
                             ", ",getPsiString())
  }

  if(grepl("BlockSum+",type2))
  {
    capitalThetaArrayType2 <- computeCapitalThetaArray(indexArray = indexArray,
                                                       sigma = sigma,
                                                       type = type2,
                                                       batchSize = batchSize)
    subTitleType2 <- paste0("sigma = " , sigma,
                            ", ",getPsiString(),
                            ", batchSize = ",batchSize)


  }else{
    capitalThetaArrayType2 <- computeCapitalThetaArray(indexArray = indexArray,
                                                       sigma = sigma,
                                                       type = type2)

    subTitleType2 <- paste0("sigma = " , sigma,
                       ", ",getPsiString())
  }
  subTitle<-ifelse(subTitleType1>subTitleType2,subTitleType1,subTitleType2)
  mainTitle <- paste0("capitalTheta(",type1,") and capitaTheta(",type2,")")
  leg <- c(paste0("CapitalTheta(",type1,")"),paste0("CapitalTheta(",type2,")"))

  path <- paste0("output/",type1,"Vs",type2,"/CapitalTheta")
  fileName = paste0("SPcapitalTheta",type1,"AndCapitalTheta",type2)

  saveJpg(fileName = fileName,path = path)
  plot(x = indexArray,y = capitalThetaArrayType1, pch = 20, col = "blue",
       main = mainTitle, sub = subTitle)
  points(x = indexArray,y = capitalThetaArrayType2, pch = 19, col="red")
  abline(h=0)
  legend("topright",col = c("blue","red"),legend = leg,pch = c(20,19))
  graphics.off()

  cat("End of test capitalThetaTypeAxis","\n")

  cat("=====================\n")
}
