
#' Forest Growth Rate Model
#'
#' @param Time time since start
#' @param C forest size measured in units of carbon
#' @param parms as list with four values, r, g, thresh, and K
#' @param r early exponential growth rate
#' @param g linear growth rate
#' @param thresh threshold canopy closure in units of carbon
#' @param K carrying capacity in units of carbon
forest_growth <- function(Time, C, parms) {
  if (C < parms$thresh) {
    dC <- parms$r * C
  } else if (C >= parms$thresh) {
    dC <- parms$g * (1 - (C / parms$K))
  }
  return(list(dC))
}
