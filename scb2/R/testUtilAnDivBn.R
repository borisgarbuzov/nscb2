testUtilAnDivBn<- function(indexArray,
                           sigma,
                           type,
                           batchSize,
                           ...)
{
  cat("\nTesting \'tests_scb2_129_AnDivBn\' \n")

  cat("Test parameters:", "\n")
  cat("indexArray =");print(indexArray);cat("\n")
  cat("sigma = ",sigma,"\n")
  cat("type = ",type,"\n")
  cat("batchSize = ",batchSize,"\n")

  if(grepl("BlockSum+",type))
  {
    An <- computeAn(indexArray = indexArray,
                    sigma = sigma,
                    type = type,
                    batchSize = batchSize)
    Bn <- computeBn(indexArray = indexArray,
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
    Bn <- computeBn(indexArray = indexArray,
                    sigma = sigma,
                    type = type,
                    batchSize = batchSize)
    subTitle <- paste0("index\n",
                       "sigma = " , sigma,
                       ", batchSize = " , batchSize,
                       ", ",getPsiString())

  }

  path <- paste0("output/",type,"/AnVsBn")
  fileName <- paste0("AnDivBn",type)
  main <- paste0("An(",type,")","/Bn(",type,")")
  saveJpg(fileName = fileName, path = path)
  plot(x = indexArray,y = An/Bn, xlab = "",
       main = main, sub = subTitle)
  graphics.off()

  fileName <- paste0("scaterAn",type,"VsBn",type)
  main <- paste0("Scaterplot An(",type,")"," Vs Bn(",type,")")
  subTitle <- paste0("sigma = " , sigma,
                     ", ",getPsiString())
  saveJpg(fileName = fileName, path = path)
  plot(x = An,y = Bn,
       main = main, sub = subTitle)
  graphics.off()

  cat("End of test AnDivBn","\n")

  cat("=====================\n")
}
