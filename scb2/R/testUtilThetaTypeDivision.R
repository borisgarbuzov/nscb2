testUtilThetaTypeDivision <- function(indexArray,
                                        sigma,
                                        type1,
                                        type2,
                                        batchSize)
{
  cat("\nTesting \'tests_scb2_113_thetaTypeDivision\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type1 = ",type1,"\n")
  cat("type2 = ",type2,"\n")


  if(grepl("BlockSum+",type1))
  {
    thetaArrayType1 <- computeThetaArray(indexArray = indexArray,
                                         sigma = sigma,
                                         type = type1,
                                         batchSize = batchSize)

    subTitleType1 <- paste0("sigma = " , sigma,
                            ", ",getPsiString(),
                            ", batchSize = ",batchSize)

  }else{

    thetaArrayType1 <- computeThetaArray(indexArray = indexArray,
                                         sigma = sigma,
                                         type = type1)
    subTitleType1 <- paste0("index\n",
                            "sigma = " , sigma,
                            ", ",getPsiString())
  }

  if(grepl("BlockSum+",type2))
  {

    thetaArrayType2 <- computeThetaArray(indexArray = indexArray,
                                         sigma = sigma,
                                         type = type2,
                                         batchSize = batchSize)
    subTitleType2 <- paste0("sigma = " , sigma,
                            ", ",getPsiString(),
                            ", batchSize = ",batchSize)

  }else{
    thetaArrayType2 <- computeThetaArray(indexArray = indexArray,
                                         sigma = sigma,
                                         type = type2)
    subTitleType2 <- paste0("index\n",
                            "sigma = " , sigma,
                            ", ",getPsiString())

  }

  subTitle<-ifelse(subTitleType1>subTitleType2,subTitleType1,subTitleType2)
  mainTitle <- paste0("theta(",type1,") / theta(",type2,")")

  path <- paste0("output/",type1,"Vs",type2,"/theta")
  fileName = paste0("theta",type1,"DivTheta",type2)

  saveJpg(fileName = fileName,path = path)
  plot(y = thetaArrayType1/thetaArrayType2,x = indexArray,
       sub = subTitle,main = mainTitle)
  graphics.off()

  cat("End of test thetaTypeDivision","\n")

  cat("=====================\n")
}
