testUtilUpperBound <- function(maxIndexArray,
                               sigma,
                               type,
                               ...)
{
  cat("\nTesting \'tests_scb2_121_upperBound\' \n")

  cat("Test parameters:", "\n")
  cat("maxIndexArray =");print(maxIndexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type = ",type,"\n")

  minIndex <- -10

  upperBoundArray <- array(dim = length(maxIndexArray))

  if(grepl("BlockSum+",type))
  {
    for(index in 1:length(maxIndexArray))
    {
      indexArray <- minIndex:maxIndexArray[index]
      upperBoundArray[index] <- computeUpperBound(indexArray = indexArray,
                                                  sigma = sigma,
                                                  type = type,
                                                  batchSize = batchSize)
    }
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", ",getPsiString(),"\n",
                       ", batchSize = ",batchSize)
  }else{
    for(index in 1:length(maxIndexArray))
    {
      indexArray <- minIndex:maxIndexArray[index]
      upperBoundArray[index] <- computeUpperBound(indexArray = indexArray,
                                                  sigma = sigma,
                                                  type = type)
    }
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", ",getPsiString())
  }

  saveJpg(fileName = paste0("upperBound",type),
          path =  paste0("output/",type,"/UpperBound"))
  plot(y = upperBoundArray,x = maxIndexArray,
       sub = subTitle, xlab = "",
       main = paste0("UpperBound(",type,")"))
  graphics.off()

  cat("End of test upperBound","\n")

  cat("=====================\n")
}
