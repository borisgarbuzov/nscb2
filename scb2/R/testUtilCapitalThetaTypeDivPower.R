testUtilCapitalThetaTypeDivPower <- function(indexArray,
                                             sigma,
                                             type1,
                                             type2,
                                             powerArray,
                                             ...)
{
  cat("\nTesting \'tests_scb2_120_capitalThetaTypeDivPower\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("powerArray =");print(powerArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type1 = ",type1,"\n")
  cat("type2 = ",type2,"\n")

  if(grepl("BlockSum+",type1))
  {
    capitalThetaArrayType1 <- computeCapitalThetaArray(indexArray = indexArray,
                                                       sigma = sigma,
                                                       type = type1,
                                                       batchSize = batchSize)
  }else{
    capitalThetaArrayType1 <- computeCapitalThetaArray(indexArray = indexArray,
                                                       sigma = sigma,
                                                       type = type1)
  }

  if(grepl("BlockSum+",type2))
  {
    capitalThetaArrayType2 <- computeCapitalThetaArray(indexArray = indexArray,
                                                       sigma = sigma,
                                                       type = type2,
                                                       batchSize = batchSize)
  }else{
    capitalThetaArrayType2 <- computeCapitalThetaArray(indexArray = indexArray,
                                                       sigma = sigma,
                                                       type = type2)
  }

  path <- paste0("output/",type1,"Vs",type2,"/CapitalTheta/Power")
  for(powerIndex in 1:length(powerArray))
  {
    fileName <- paste0("compareCapitaTheta",type1,"VsCapitalTheta",type2,"withPower_",
                       round(powerArray[powerIndex],digits = 4))
    if(type1=="BlockSum" | type2 =="BlockSum" )
    {
      subTitle <- paste0("index\n",
                         "sigma = " , sigma,
                         ", batchSize = ",batchSize,
                         ", power = ",round(powerArray[powerIndex],digits = 4),"\n",
                         ", ",getPsiString())
    }else{
      subTitle <- paste0("index\n",
                         "sigma = " , sigma,
                         ", power = ",round(powerArray[powerIndex],digits = 4),
                         ", ",getPsiString())
    }

    yMax <- max(capitalThetaArrayType1/(capitalThetaArrayType2^powerArray[powerIndex]),na.rm = T)
    yMax <- yMax*0.05 + yMax

    saveJpg(fileName,path = path)
    plot(x = indexArray,
         y = (capitalThetaArrayType1/(capitalThetaArrayType2^powerArray[powerIndex])),
         main = paste0("capitalTheta(",type1,")/ capitalTheta(",type2,")^",
                       round(powerArray[powerIndex],digits = 4)),
         xlab = "",ylim = c(0,yMax),
         sub = subTitle)
    abline(h = 0)
    graphics.off()
  }

  cat("End of test capitalThetaTypeDivPower","\n")

  cat("=====================\n")
}
