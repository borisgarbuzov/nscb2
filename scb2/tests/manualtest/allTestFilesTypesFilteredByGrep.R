
# prerequisities ----

# loading the libs in
library(devtools)
library(testthat)
library(plyr)

# scb2 package is to be loaded too
devtools::load_all()

# saving getwd() to a variable
# (we have to restore it back
# as the test routine is completed)
saved.getwd <- getwd()

# entering inside of "scb2/scb2/tests/testthat/" dir
setwd("tests/testthat/")
type <- "scb2"

filesList <- list.files()
filesList <- grep("+.R",filesList,value = TRUE)
filesList <- switch (type,
  scb = grep("+scb[^2]+",filesList,value = TRUE),
  prod2 = grep("+prod2+",filesList,value = TRUE),
  scb2 = grep("+scb2+",filesList,value = TRUE)
)

lengthFilesList <- length(filesList)
# for (i in seq_len(lengthFilesList)) {
#   zz <- file(fileName, open="at")
#   sink(zz, append = T, type = c("output", "message"))
#   result <- paste0(i, "/", lengthFilesList,
#                    " tests completed (",
#                    round(i * 100 / lengthFilesList, 1), "%)."
#                    )
#   cat("\n", result, "\n")
#
#   if (i == lengthFilesList) {
#     cat("\n CONGRATS! All the texts have been completed!")
#   }
#
#   closeAllConnections()
# }

# Trying to keep some coal from burning -----------------
curTime <- Sys.time()
curTime <- gsub(pattern = ":", replacement = "-", x = curTime)
curTime <- gsub(pattern = " ", replacement = "_", x = curTime)
fileName <- paste0("testManualLogCreatedWithPlyrLply_", curTime, ".txt")

fileName <- file.path(paste0("../manualtest/", fileName))

library(plyr)
plyr::l_ply(filesList, function(i) {
  zz <- file(fileName, open="at")
  sink(zz)
  testthat::test_file(i, reporter = "rstudio")
  elementIndex <- which(filesList == i)
  result <- paste0(elementIndex, "/", lengthFilesList, " tests completed (",
                   round(elementIndex * 100 / lengthFilesList, 1), "%)."
  )
  cat(i, " are processed. \n")
  cat(result, "\n")
  closeAllConnections()
},
.print = T,
# .progress = "text"
.progress = "win"
#.parallel = T,
)

closeAllConnections()


# restoring the old work dir, ------------
# that is,  the root dir of the package -- "scb2/scb2"
setwd(saved.getwd)

# l_ply(list(1:1000), function(i){rnorm(i)}, .progress="text")


