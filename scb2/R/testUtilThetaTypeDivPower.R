testUtilThetaTypeDivPower <- function(indexArray,
                                      sigma,
                                      type1,
                                      type2,
                                      powerArray,
                                      batchSize)
{
  cat("\nTesting \'tests_scb2_114_thetaTypeDivPower\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("powerArray =");print(powerArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type1 = ",type1,"\n")
  cat("type2 = ",type2,"\n")

  if(grepl("BlockSum+",type1))
  {
    thetaArrayType1 <- computeThetaArray(indexArray = indexArray,
                                         sigma = sigma,
                                         type = type1,
                                         batchSize = batchSize)
  }else{
    thetaArrayType1 <- computeThetaArray(indexArray = indexArray,
                                         sigma = sigma,
                                         type = type1)
  }

  if(grepl("BlockSum+",type2))
  {
    thetaArrayType2 <- computeThetaArray(indexArray = indexArray,
                                         sigma = sigma,
                                         type = type2,
                                         batchSize = batchSize)

  }else{
    thetaArrayType2 <- computeThetaArray(indexArray = indexArray,
                                         sigma = sigma,
                                         type = type2)
  }

  path <- paste0("output/",type1,"Vs",type2,"/Theta/Power")
  for(powerIndex in 1:length(powerArray))
  {
    fileName <- paste0("compareTheta",type1,"VsTheta",type2,"withPower_",
                       round(powerArray[powerIndex],digits = 4))
    if(type1=="BlockSum" | type2 =="BlockSum" )
    {
      subTitle <- paste0("index\n",
                         "sigma = " , sigma,
                         ", batchSize = ",batchSize,
                         ", power = ",round(powerArray[powerIndex],digits = 3),"\n",
                         ", ",getPsiString())
    }else{
      subTitle <- paste0("index\n",
                         "sigma = " , sigma,
                         ", power = ",round(powerArray[powerIndex],digits = 3),
                         ", ",getPsiString())
    }
    yMax <- max(thetaArrayType1/(thetaArrayType2^powerArray[powerIndex]),na.rm = T)
    yMax <- yMax*0.05 + yMax

    saveJpg(fileName,path = path)
    plot(x = indexArray,
         y = (thetaArrayType1/(thetaArrayType2^powerArray[powerIndex])),
         main = paste0("theta(",type1,")/Theta(",type2,")^",
                       round(powerArray[powerIndex],digits = 4)),
         xlab = "",ylim = c(0,yMax),
         sub = subTitle)
    abline(h = 0)
    graphics.off()
  }

  cat("End of test thetaTypeDivPower","\n")

  cat("=====================\n")
}
