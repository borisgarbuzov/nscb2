testUtilLambda <- function(indexArray,
                           sigma,
                           type,
                           ...)
{
  cat("\nTesting \'tests_scb2_116_lambda\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type = ",type,"\n")


  if(grepl("BlockSum+",type))
  {
    lambdaArray <- computeLambdaArray(indexArray = indexArray,
                                      sigma = sigma,
                                      type = type,
                                      batchSize = batchSize)
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", ",getPsiString(),"\n",
                       ", batchSize = ",batchSize)
  }else{
    lambdaArray <- computeLambdaArray(indexArray = indexArray,
                                      sigma = sigma,
                                      type = type)
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", ",getPsiString())
  }
  saveJpg(fileName = paste0("lambda",type),
          path = paste0("output/",type,"/Lambda"))
  plot(y = lambdaArray,x = indexArray,
       sub = subTitle, xlab = "",
       main = paste0("Lambda(",type,")"))
  graphics.off()

  cat("End of test lambda","\n")

  cat("=====================\n")
}
