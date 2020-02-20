plotSnakes3D <- function(sampleSizeArray,
                         bCovConstArray,
                         nrf2dArray,
                         zhou2dArray,
                         modErrorQuantile2dArray,
                         parList) {

  # check if "output" directory exist, if doesn't create one
  if(!dir.exists("output"))
  {
    dir.create("output",recursive = TRUE)
  }

  # make headers for csv
  prefix <- "bCovConst"
  myColNames <- c()
  for (i in bCovConstArray) {
    tempName <- paste0(prefix, "=", i)
    myColNames <- c(myColNames, tempName)
  }

  # add column names in arrays
  colnames(nrf2dArray) <- myColNames
  colnames(zhou2dArray) <- myColNames
  colnames(modErrorQuantile2dArray) <- myColNames

  # mockup for file name
  mockupFileName <- paste("minSs =", parList$minSampleSize,
                          "maxSs =", parList$maxSampleSize,
                          "ssStep =", parList$sampleSizeStep,
                          "bCMin =", parList$bConstMin,
                          "bCMax =", parList$bConstMax,
                          "bCStep =", parList$bConstStep,
                          "tParCount =", parList$tParCount,
                          "rc =", parList$replicationCount,
                          "lag =", parList$lag,
                          "sigma =", parList$sigma,
                          "mean =", parList$mean,
                          "alpha =", parList$nonCoverageProbability)

  #-----------------------------------------------------------------------------
  # 3D plot for non random factor
  # cerate a mockup for file name

  nrfFileName <- paste("3D for NRF", mockupFileName)

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/", nrfFileName, ".svg")
  fileNameCSV <- paste0("output/", nrfFileName, ".csv")

  # write data to csv file
  write.csv(x = list(sampleSize = sampleSizeArray, nrf2dArray),
            file = fileNameCSV, row.names = F)

  svg(filename = fileNameGraph)

  print(wireframe(nrf2dArray, xlab = "sampleSize", ylab = "bCovConst",
                  zlab = list("NRF", rot = 90), main = "3D for NRF", drape = T))

  dev.off()

  #-----------------------------------------------------------------------------
  # 3D plot for bootstrap NRF
  # cerate a mockup for file name

  zhouFileName <- paste("3D for bootstrap", mockupFileName)

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/", zhouFileName, ".svg")
  fileNameCSV <- paste0("output/", zhouFileName, ".csv")

  # write data to csv file
  write.csv(x = list(sampleSize = sampleSizeArray, zhou2dArray),
            file = fileNameCSV, row.names = F)

  svg(filename = fileNameGraph)

  print(wireframe(zhou2dArray, xlab = "sampleSize", ylab = "bCovConst",
                  zlab = list("bootstrap", rot = 90),
                  col.main = "red", main = "3D for bootstrap", drape = T))

  dev.off()

  #-----------------------------------------------------------------------------
  # 3D plot for modified error
  # cerate a mockup for file name

  modErrorFileName <- paste("3D for modified error", mockupFileName)

  # construct two filenames with diffirent extensions for csv and svg
  fileNameGraph <- paste0("output/", modErrorFileName, ".svg")
  fileNameCSV <- paste0("output/", modErrorFileName, ".csv")

  # write data to csv file
  write.csv(x = list(sampleSize = sampleSizeArray, modErrorQuantile2dArray),
            file = fileNameCSV, row.names = F)

  svg(filename = fileNameGraph)

  print(wireframe(modErrorQuantile2dArray, xlab = "sampleSize",
                  ylab = "bCovConst", zlab = list("mod error", rot = 90),
                  col.main = "darkgreen", main = "3D for modified error",
                  drape = T))

  dev.off()
}
