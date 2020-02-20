testUtilUpperBoundAxis <- function(maxIndexArray,
                                          sigma,
                                          type1,
                                          type2,
                                          ...)
{
  cat("\nTesting \'tests_scb2_122_upperBoundAxis\' \n")

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
  mainTitle <- paste0("upperBound(",type1,") and upperBound(",type2,")")
  leg <- c(paste0("upperBound(",type1,")"),paste0("upperBound(",type2,")"))

  path <- paste0("output/",type1,"Vs",type2,"/UpperBound")
  fileName = paste0("upperBound",type1,"AndUpperBound",type2)

  yMax <- max(upperBoundType2,upperBoundType1)
  yMin <- min(upperBoundType2,upperBoundType1)

  yMax <- yMax * 0.05 + yMax
  yMin <- yMin - yMin * 0.05

  saveJpg(fileName = fileName,path = path)
  plot(x = maxIndexArray,y = upperBoundType1, pch = 20, col = "blue",
       main = mainTitle, sub = subTitle, ylim = c(yMin,yMax))
  points(x = maxIndexArray,y = upperBoundType2, pch = 19, col="red")
  legend("topleft",col = c("blue","red"),legend = leg,pch = c(20,19))
  abline(h = 0)
  graphics.off()

  cat("End of test upperBoundAxis","\n")

  cat("=====================\n")
}
