#' Transformation
#'
#' @description
#' This function converts the time series matrix into a matrix with
#' the times of occurrence of the events of interest.
#'
#' @param mat an array containing in each column the time series
#' corresponding to each location.
#' @param lim the threshold of interest.
#'
#' @example examples/examples_transforma.R
#'
#' @export
transforma <- function(mat, lim) {
  n <- length(mat)

  res <- NULL

  for (i in 1:n) {
    if ((mat[i] >= lim)) {
      temp <- i
      res <- c(res, temp)
    }
  }

  res
}
