printInfoAboutTwoSamples <- function(sample1,
                                     sample2) {
  cat("Info about sample1: ", summary(sample1), "\n")
  hist(sample1)

  cat("Info about sample2: ", summary(sample2), "\n")
  hist(sample2)
}
