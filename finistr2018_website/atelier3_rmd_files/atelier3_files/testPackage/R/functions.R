#' Ultra fast equivalent of fonction coeff()
#'
#' Mimicks coeff() function but with greater SWAG
#'
#' @param x regressors
#' @param y observations
#'
#' @return Estimated coefficients of linear regression, using least square loss
#' @seealso lm function (deprecated)
#' @examples
#' x <- seq(0, 1, length = 10);
#' y <- 1 + 2 * x + rnorm(length(x), 0, 0.1)
#' estimate(y, x)
#' @export
estimate <- function(y,x){
  return(lm(y ~ x)$coefficients)
}
