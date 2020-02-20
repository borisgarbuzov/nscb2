testUtilBn <- function(indexArray,
                       sigma,
                       type,
                       batchSize,
                       ...)
{
  cat("\nTesting \'tests_scb2_127_Bn\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type = ",type,"\n")
  cat("batchSize = ",batchSize,"\n")

  if(grepl("BlockSum+",type))
  {
    Bn <- computeBn(indexArray = indexArray,
                    sigma = sigma,
                    type = type,
                    batchSize = batchSize)
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", batchSize = " , batchSize,
                       ", ",getPsiString())
  }else{
    Bn <- computeBn(indexArray = indexArray,
                    sigma = sigma,
                    type = type,
                    batchSize)
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", batchSize = " , batchSize,
                       ", ",getPsiString())

  }

  path <- paste0("output/",type,"/Bn")
  fileName <- paste0("Bn",type)
  main <- paste0("Bn(",type,")")
  saveJpg(fileName = fileName, path = path)
  plot(x = indexArray,y = Bn, xlab = "",
       main = main, sub = subTitle)
  graphics.off()

  cat("End of test Bn","\n")

  cat("=====================\n")
}
