testUtilDn <- function(indexArray,
                       sigma,
                       type,
                       batchSize,
                       ...)
{
  cat("\nTesting \'tests_scb2_128_Dn\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type = ",type,"\n")
  cat("batchSize = ",batchSize,"\n")

  if(grepl("BlockSum+",type))
  {
    Dn <- computeDn(indexArray = indexArray,
                    sigma = sigma,
                    type = type,
                    batchSize = batchSize)
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", batchSize = " , batchSize,
                       ", ",getPsiString())
  }else{
    Dn <- computeDn(indexArray = indexArray,
                    sigma = sigma,
                    type = type,
                    batchSize = batchSize)

    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", batchSize = " , batchSize,
                       ", ",getPsiString())

  }

  path <- paste0("output/",type,"/Dn")
  fileName <- paste0("Dn",type)
  main <- paste0("Dn(",type,")")
  saveJpg(fileName = fileName, path = path)
  plot(x = indexArray,y = Dn, xlab = "",
       main = main, sub = subTitle)
  graphics.off()

  cat("End of test Dn","\n")

  cat("=====================\n")
}
