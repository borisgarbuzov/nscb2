createDiagHorSamples <- function(sampleSize,
                                tParCount,
                                mean = 0,
                                sigma,
                                noise = NULL,
                                type = "MA1")
{
  if(type == "MA1"){
    sampleList <- createDiagHorSamplesMA1(sampleSize,
                                         tParCount,
                                         mean = 0,
                                         sigma,
                                         noise = noise)
  }
  if(type == "ScaledNoise"){
    sampleList <- createDiagHorSamplesScaledNoise(sampleSize,
                                                 tParCount,
                                                 mean = 0,
                                                 sigma,
                                                 noise = noise)
  }
  return(sampleList)
}
