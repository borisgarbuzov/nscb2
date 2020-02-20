testUtilCapitalThetaTypeScaterplot <- function(indexArray,
                                               sigma,
                                               type1,
                                               type2,
                                               ...)
{
  cat("\nTesting \'tests_scb2_118_capitalThetaTypeScaterplot\' \n")

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
  mainTitle <- paste0("scateplot capitalTheta(",type1,") vs capitaTheta(",type2,")")

  path <- paste0("output/",type1,"Vs",type2,"/CapitalTheta")
  fileName = paste0("SPCapitalTheta",type1,"VsCapitalTheta",type2)

  saveJpg(fileName = fileName,path = path)
  plot(y = capitalThetaArrayType1,x = capitalThetaArrayType2,
       sub = subTitle,main = mainTitle)
  graphics.off()
  cat("End of test capitalThetaTypeScaterplot","\n")

  cat("=====================\n")
}
