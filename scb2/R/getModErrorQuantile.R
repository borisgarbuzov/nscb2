getModErrorQuantile <- function(sampleSize) {

  modErrorTabulatedQuantileArray <- list(
    "1000" = 0.374187659502642,
    "2000" = 0.306089112840679,
    "3000" = 0.264880045870315,
    "4000" = 0.236173240672383,
    "5000" = 0.209363042520974,
    "6000" = 0.207223151542854,
    "7000" = 0.188180317985049,
    "8000" = 0.185708005195039,
    "9000" = 0.170585075569703,
    "10000" = 0.166077741428594,
    "11000" = 0.169138312505555,
    "12000" = 0.158585370179586,
    "13000" = 0.15125157715075,
    "14000" = 0.152970427534715,
    "15000" = 0.143970994755239,
    "16000" = 0.139580929067389,
    "17000" = 0.141180775847092,
    "18000" = 0.139885302898515,
    "19000" = 0.135356460638351,
    "20000" = 0.131552445299345)

  sampleSizeArray <- seq(from = 1000, to = 20000, by = 1000)
  if (sampleSize %in% sampleSizeArray) {
    sampleSizeIndex <- toString(sampleSize)
    quantile <- as.double(modErrorTabulatedQuantileArray[sampleSizeIndex])
  }
  else {
    cat("Should be one in ", sampleSizeArray, "\n")
    stop("Wrong sampleSize.")
  }

  return (quantile)
}
