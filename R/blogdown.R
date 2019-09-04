#' Retrieve raw R code from a blogdown web page
#'
#'
#' @name blogdown
#'
#' @usage blogdown(url)
#'
#' @param url Link to a blogdown web page
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#'
#' @export
#'
#' @examples
#' library(dplyr)
#' blogdown("https://www.jtimm.net/2019/04/14/lexical-change-procrustes/")
#'
#' # Same as above but provided to cat for easy viewing
#' blogdown("https://www.jtimm.net/2019/04/14/lexical-change-procrustes/")  %>%
#'   cat
#'


blogdown <- function(url) {
  url %>% xml2::read_html(.) %>%
    html_nodes("code") %>% html_text %>% paste0(., collapse="\n")
}













