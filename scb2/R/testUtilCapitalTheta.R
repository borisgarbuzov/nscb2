testUtilCapitalTheta <- function(indexArray,
                                 sigma,
                                 type,
                                 ...)
{
  cat("\nTesting \'tests_scb2_117_capitalTheta\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type = ",type,"\n")

  if(grepl("BlockSum+",type))
  {

    capitalThetaArray <- computeCapitalThetaArray(indexArray = indexArray,
                                                  sigma = sigma,
                                                  type = type,
                                                  batchSize = batchSize)

    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", ",getPsiString(),"\n",
                       ", batchSize = ",batchSize)
  }else{

    capitalThetaArray <- computeCapitalThetaArray(indexArray = indexArray,
                                                  sigma = sigma,
                                                  type = type)

    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", ",getPsiString())
  }

  saveJpg(fileName = paste0("capitalTheta",type,"test"),
          path =  paste0("output/",type,"/CapitalTheta"))
  plot(y = capitalThetaArray,x = indexArray,sub = subTitle,
       xlab = "",
       main = paste0("capitalTheta(",type,")"))
  graphics.off()

  cat("End of test capitalTheta","\n")

  cat("=====================\n")
}
