#' Wrapper function to run ODE solver and compute metrics for Sobol sensitivity analysis
#'
#' @param r early exponential growth rate
#' @param g linear growth rate
#' @param thresh threshold canopy closure in units of carbon
#' @param K carrying capacity in units of carbon
#' @param C_initial initial forest size measured in units of carbon
#' @param time time in years
#' @param func 
#'
#' @return
#' @export
#'
#' @examples
p_wrapper <- function(r, g, thresh, K, C_initial, time, func) {
  # Get list of parameters for forest growth function
  parms <- list(r=r, g=g, thresh=thresh, K=K)

  # Run ode solver
  result <- ode(
    y = C_initial, times = time, func = func, parms = parms, method = "daspk"
  )

  # Create column names
  colnames(result) <- c("time", "C")

  # Compute metrics
  metrics <- compute_metrics(as.data.frame(result))

  return(metrics)
}
