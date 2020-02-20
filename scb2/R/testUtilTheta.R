testUtilTheta <- function(indexArray,
                          sigma,
                          type,
                          ...)
{
  cat("\nTesting \'tests_scb2_115_theta\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type = ",type,"\n")

  if(grepl("BlockSum+",type))
  {
    thetaArray <- computeThetaArray(indexArray = indexArray,
                                    sigma = sigma,
                                    type = type,
                                    batchSize = batchSize)
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", ",getPsiString(),"\n",
                       ", batchSize = ",batchSize)
  }else{
    thetaArray <- computeThetaArray(indexArray = indexArray,
                                    sigma = sigma,
                                    type = type)
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", ",getPsiString())
  }

  saveJpg(fileName = paste0("theta",type),path =  paste0("output/",type,"/Theta"))
  plot(y = thetaArray,x = indexArray,xlab = "",
       sub = subTitle,
       main = paste0("Theta(",type,")"))
  graphics.off()

  cat("End of test theta","\n")

  cat("=====================\n")
}
