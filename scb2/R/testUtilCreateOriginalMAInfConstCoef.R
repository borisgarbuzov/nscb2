#' @export

testUtilCreateOriginalMAInfConstCoef <- function(size,
                                                 sigma,
                                                 mean,
                                                 psi,
                                                 psiMaxSize,
                                                 psiIncrement) {
  cat("\nTesting \'tests_04a_createOriginalMAInfConstCoef\' \n")

  cat("Test parameters:", "\n")
  cat("size =", size, "\n")
  cat("psi =", psi, "\n")
  cat("psiMaxSize =", psiMaxSize, "\n")
  cat("sigma =", sigma, "\n")
  cat("mean =", mean, "\n")

  Start <- Sys.time()

  originalMAInfConstCoef <- createOriginalMAInfConstCoef(size = size,
                                             sigma = sigma,
                                             mean = mean,
                                             psi = psi,
                                             psiMaxSize = psiMaxSize,
                                             psiIncrement = psiIncrement)
  colMeansOriginal <- colMeans(originalMAInfConstCoef)
  varOriginal <- apply(originalMAInfConstCoef, MARGIN = 2, var)

  darkestColor <- "dark blue"
  lightestColor <- "light blue"
  colfunc <- colorRampPalette(c(darkestColor, lightestColor))
  yMax <- max(originalMAInfConstCoef)
  yMin <- min(originalMAInfConstCoef)
  yMax <- max(yMax, varOriginal)
  yMin <- min(yMin, varOriginal)

  yMaxMinMargin <- sd(originalMAInfConstCoef) * 0.5
  yMax <- yMax + yMaxMinMargin
  yMin <- yMin - yMaxMinMargin


  dir.create(file.path("./", "plots"), showWarnings = FALSE)
  # Forming a path to the exported products image
  full.name = paste0("originalMAInfConstCoef_",
                     "size_",
                     size,
                     "_mean_",
                     mean,
                     "_sigma_",
                     sigma,
                     "_psi_",
                     psi,
                     "_psiMaxSize_",
                     psiMaxSize)
  full.name <- gsub("\\.","", full.name)
  full.name <- paste0(full.name,".jpeg")
  subTitle <- paste0("size = ",size,
                     ", mean = ",mean,
                     ", sigma = ",sigma,
                     ", psi = ",psi,
                     ", psiMaxSize = ",psiMaxSize)
  plot.path <- file.path("./", "plots", full.name)

  jpeg(plot.path)
  matplot(originalMAInfConstCoef,
          ylim=c(yMin, yMax),
          xlab = "",
          type = 'l',
          lty = 1,
          col = colfunc(psiMaxSize))
  title(main = "originalMAInfConstCoef",sub = subTitle)
  legend("topleft",fill = c("blue","green","red"),
         legend = c("Sample paths","Running inter-sample mean","Running inter-sample variance"))
  lines(varOriginal, col = "red")
  lines(colMeansOriginal, col = "green")
  graphics.off()

  End <- Sys.time()

  duration <- End - Start
  cat("Result:\n")
  cat("originalMAInfConstCoef = \n")
  print(originalMAInfConstCoef[1:10])

  expect_that(dim(originalMAInfConstCoef)[1], equals(size))
  cat(" - length of originalMAInfConstCoef array is all right. \n")
  cat("Duration =", duration, "\n")
  cat("End of test createOriginalMAInfConstCoef","\n")
  cat("=====================\n")
}
