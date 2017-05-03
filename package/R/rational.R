#' Rational Number
#' 
#' Data type and functions to work with rational numbers.
#' 
#' @param num (integer) numerator
#' @param denom (integer) denominator
#' 
#' @details ...
#'  
#' @value ...
#' 
#' @export
#' @examples
#' rat <- rational(1:3, 3:5)
#' rat + 1
rational <- function(num, denom) {
  out <- mapply(c, num, denom, SIMPLIFY = FALSE)
  class(out) <- "rational"
  out
}

#' @export
print.rational <- function(x, ...) {
  map(x, paste, collapse = "/") %>% 
    flatten_chr() %>%
    cat()
  invisible(x)
}

#' @export
"+.rational" <- function(x, y) {
  denom <- sapply(x, function(x) x[2])
  num <- sapply(x, function(x) x[1])
  num <- num + y * denom
  rational(num, denom)
}
