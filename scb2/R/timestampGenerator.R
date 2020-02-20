timestampGenerator <- function(fileName)
{
  curTime <-format(Sys.time(),"%M_%S")
  fileName <- paste(fileName,curTime,sep = "_")
  return(fileName)
}
