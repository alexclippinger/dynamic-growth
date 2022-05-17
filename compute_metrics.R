#' Computes desired metrics
#'
#' @param result
#'
#' @return
compute_metrics <- function(result) {
  maxC <- max(result$C)
  meanC <- mean(result$C)
  return(list(maxC = maxC, meanC = meanC))
}