testUtilUpperBoundScaterplot <- function(maxIndexArray,
                                                sigma,
                                                type1,
                                                type2,
                                                ...)
{
  cat("\nTesting \'tests_scb2_123_upperBoundScaterplot\' \n")

  cat("Test parameters:", "\n")
  cat("maxIndexArray =");print(maxIndexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type1 = ",type1,"\n")
  cat("type2 = ",type2,"\n")

  minIndex <- -5

  upperBoundType1 <- array(dim = length(maxIndexArray))
  upperBoundType2 <- array(dim = length(maxIndexArray))

  if(grepl("BlockSum+",type1))
  {
    for(index in 1:length(maxIndexArray))
    {
      indexArray <- minIndex:maxIndexArray[index]
      upperBoundType1[index] <- computeUpperBound(indexArray = indexArray,
                                                  sigma = sigma,
                                                  type = type1,
                                                  batchSize = batchSize)
    }
    subTitle <- paste0("sigma = " , sigma,
                       ", ",getPsiString(),
                       ", batchSize = ",batchSize)
  }else{

    for(index in 1:length(maxIndexArray))
    {
      indexArray <- minIndex:maxIndexArray[index]
      upperBoundType1[index] <- computeUpperBound(indexArray = indexArray,
                                                  sigma = sigma,
                                                  type = type1)
    }
    subTitleType1 <- paste0("sigma = " , sigma,
                            ", ",getPsiString())
  }

  if(grepl("BlockSum+",type2))
  {
    for(index in 1:length(maxIndexArray))
    {
      indexArray <- minIndex:maxIndexArray[index]
      upperBoundType2[index] <- computeUpperBound(indexArray = indexArray,
                                                  sigma = sigma,
                                                  type = type2,
                                                  batchSize = batchSize)
    }
    subTitleType2 <- paste0("sigma = " , sigma,
                            ", ",getPsiString(),
                            ", batchSize = ",batchSize)

  }else{
    for(index in 1:length(maxIndexArray))
    {
      indexArray <- minIndex:maxIndexArray[index]
      upperBoundType2[index] <- computeUpperBound(indexArray = indexArray,
                                                  sigma = sigma,
                                                  type = type2)
    }

    subTitleType2 <- paste0("sigma = " , sigma,
                             ", ",getPsiString())

  }
  subTitle<-ifelse(subTitleType1>subTitleType2,subTitleType1,subTitleType2)
  mainTitle <- paste0("scateplot upperBound(",type1,") vs upperBound(",type2,")")

  path <- paste0("output/",type1,"Vs",type2,"/UpperBound")
  fileName = paste0("SPUpperBound",type1,"VsUpperBound",type2)

  saveJpg(fileName = fileName,path = path)
  plot(y = upperBoundType1,x = upperBoundType2,
       sub = subTitle,main = mainTitle)
  graphics.off()

  cat("End of test upperBoundScaterplot","\n")

  cat("=====================\n")
}
