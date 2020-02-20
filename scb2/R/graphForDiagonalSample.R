graphForDiagonalSample <- function(sampleSize = 100,
                                   tParCount = 100,
                                   mean = 0,
                                   sigma = 2){
  samples = createDiagHorSamples(sampleSize = sampleSize,
                                 tParCount = tParCount,
                                 mean = 0,
                                 sigma = sigma)
  diagonalSample = samples[[2]]
  fileName = "output/graphForDiagonalSample.svg"
  svg(fileName)
  color1Array = array(data="blue", dim = length(diagonalSample))
  plot(x = c(1:length(diagonalSample)), y = diagonalSample,
       xlab = "number of element", ylab = "Value",
       col = color1Array,
       xlim = c(0, length(diagonalSample)), ylim = c(min(diagonalSample), max(diagonalSample)),
       main = "Graph for diagonal sample", pch = 21, bg = color1Array)
  dev.off()
}
