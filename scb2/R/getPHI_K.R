getPHI_K <- function(type = "diff") {
  if (type == "diff") {
    return(getPHI_K_NORMAL_DIFF())
  }
  if (type == "normal") {
    return(0.282094791773878)
  }
}
