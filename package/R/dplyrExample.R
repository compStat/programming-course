#' Transform Data
#' 
#' @param df (data.frame) some data
#' 
#' @export
transformData <- function(df) {
  df %>% 
    mutate_(y =~ x)
}