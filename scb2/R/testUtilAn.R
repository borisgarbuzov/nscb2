testUtilAn <- function(indexArray,
                       sigma,
                       type,
                       ...)
{
  cat("\nTesting \'tests_scb2_126_An\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type = ",type,"\n")

  if(grepl("BlockSum+",type))
  {
    An <- computeAn(indexArray = indexArray,
                    sigma = sigma,
                    type = type,
                    batchSize = batchSize)
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", batchSize = " , batchSize,
                       ", ",getPsiString())
  }else{
    An <- computeAn(indexArray = indexArray,
                    sigma = sigma,
                    type = type)
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", ",getPsiString())

  }
  path <- paste0("output/",type,"/An")
  fileName <- paste0("An",type)
  main <- paste0("An(",type,")")
  saveJpg(fileName = fileName, path = path)
  plot(x = indexArray,y = An, xlab = "",
       main = main, sub = subTitle)
  graphics.off()

  cat("End of test An","\n")

  cat("=====================\n")
}
