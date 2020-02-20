durationTime <- function(duration)
{
  if(duration >= 3600)
  {
    hour <- floor(duration / 3600)
    minute <- floor(duration %% 3600 / 60)
    second <- floor(duration %% 3600 %% 60)
    return(paste0("duration = ", hour,"hour ",minute," minute ",second," second"))
  }else if(duration >= 60)
  {
    minute <- floor(duration %% 3600 / 60)
    second <- floor(duration %% 3600 %% 60)
    return(paste0("duration = ", minute," minute ",second," second"))
  }else
  {
    return(paste0("duration = ", round(duration,3)," second"))
  }
}
