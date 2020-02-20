#' @title createDHatMatrix
#'
#' @name createDHatMatrix
#'
#' @aliases createDHatMatrix
#'
#' @description Creating a two-dimensional array of dimensions \code{c(size - 1, size - 1)}.
#'
#' @param betaArray betaArray
#'
#' @return Returning a two-dimensional array of dimensions \code{c(size - 1, size - 1)}.
#'
#' @examples
#' original <- createOriginalMA1(size = 10, psi = 0.5, sigma = 1)
#' betaArray <- createBetaArray <- function(original, rho = 0.5)
#' createDHatMatrix(betaArray, size = 10)
#'
#' @export

createDHatMatrix <- function(betaArray) {
  # Please, take notice:
  # 'size' value in the scope of this function
  # is not the same as 'size' value in the 'originalMA1' array,
  # 'size' value in the scope of this function equals size - 1,
  # being dim(betaArray)[1] (number of rows) equals size - 1
  size <- dim(betaArray)[2]
  # Eliminating all NA's
  betaArrayWithoutNA <- apply(betaArray[ , -1], MARGIN = 2, na.exclude)
  # Creating an empty list
  dHatList <- vector("list", size)

  # Filling cHatList with ACF values
  for (i in 1:(size-1)) { # remember, 'size' here is size - 1 actually
    acfOfIthBetaArrayWithoutNA <- acf(betaArrayWithoutNA[[i]],
                                      type = "covariance")
    dHatList[[i]] <- as.vector(
      unlist(
        acfOfIthBetaArrayWithoutNA$acf))
  }

  # Building the final matrix,
  # complementing the missing values with NA's
  dHatMatrix <- array(0, dim = c(length(unlist(dHatList[[1]])),
                                 size)) # remember, 'size' here is size - 1 actually
  #
  for (i in 1:(size)) { # remember, 'size' here is size - 1 actually
    difLength <- dim(dHatMatrix)[1] - length(unlist(dHatList[i]))
    ifelse(difLength == 0,
           dHatMatrix[, i] <- unlist(dHatList[i]),
           dHatMatrix[, i] <- c(unlist(dHatList[i]),
                                rep(0, difLength)))
  }

  dHatMatrix <- cbind(0, dHatMatrix)
  dHatMatrix
}
