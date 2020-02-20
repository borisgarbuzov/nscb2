testUtilUpperBoundDivPower <- function(maxIndexArray,
                                       sigma,
                                       type1,
                                       type2,
                                       powerArray,
                                       ...)
{
  cat("\nTesting \'tests_scb2_125_upperBoundDivPower\' \n")

  cat("Test parameters:", "\n")
  cat("maxIndexArray =");print(maxIndexArray);cat("\n")
  cat("powerArray =");print(powerArray);cat("\n")
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
  path <- paste0("output/",type1,"Vs",type2,"/UpperBound/Power")
  for(powerIndex in 1:length(powerArray))
  {
    fileName <- paste0("compareUpperBound",type1,"VsUpperBound",type2,"withPower_",
                       round(powerArray[powerIndex],digits = 3))
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

    yMax <- max(upperBoundType1/(upperBoundType2^powerArray[powerIndex]),na.rm = T)
    yMax <- yMax*0.05 + yMax

    saveJpg(fileName,path = path)
    plot(x = maxIndexArray,
         y = (upperBoundType1/(upperBoundType2^powerArray[powerIndex])),
         main = paste0("upperBound(",type1,")/ upperBound(",type2,")^",
                       round(powerArray[powerIndex],digits = 3)),
         xlab = "", ylim = c(0,yMax),
         sub = subTitle)
    abline(h = 0)
    graphics.off()
  }

  cat("End of test upperBoundDivPower","\n")

  cat("=====================\n")
}
