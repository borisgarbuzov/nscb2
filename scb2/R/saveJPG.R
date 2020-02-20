#'
#'@export

saveJpg <- function(fileName, path)
{
  if(!dir.exists(path))
  {
    dir.create(path,recursive = TRUE)
  }

  fileName <- gsub("\\.","", fileName)
  #curTime <-format(Sys.time(),"%M_%S")

  fileName <- gsub(" ","_", paste0(fileName,".jpg"))
  #fileName <- gsub(":", "_", fileName)
  jpeg(paste0(path, "/", fileName))
}
