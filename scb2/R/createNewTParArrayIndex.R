createNewTParArrayIndex <- function(tParArray,
                                    bandWidth)
{
  newTParArrayIndex <- array(data = 0, dim = 2)
  bool <- T

  for(i in 1:length(tParArray)){
    if((bool) & tParArray[i]>bandWidth){
      newTParArrayIndex[1] <- i
      bool <- F
    }
    if((!bool) & (tParArray[i] < 1-bandWidth)){
      newTParArrayIndex[2] <- i
    }
  }

  return(newTParArrayIndex)
}
