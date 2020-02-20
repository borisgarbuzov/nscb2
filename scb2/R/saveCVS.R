#'
#'@export

saveCVS <- function(fileName, path, dataToSave)
{
  if(!dir.exists(path))
  {
    dir.create(path,recursive = TRUE)
  }

 # curTime <- Sys.time()
  #curTime <- gsub(":", "-", curTime)
  fileName <- gsub("\\.","", fileName)
  fileName <- gsub(" ","_", paste0(fileName, "_",".csv"))
  fileName <- gsub(":","_", fileName)
  write.csv(dataToSave, paste0(path, "/", fileName))
}
