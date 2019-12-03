#' Retrieve raw R code from a kaggle notebook
#'
#'
#' @name r_bloggers
#'
#' @usage r_bloggers(url, method, padding)
#'
#' @param url Link to an R-bloggers article
#' @param method Not all websites are formatted consistently. To overcome this, try a different
#'     method by setting the method
#'     parameter to integers 2 and greater to try other available methods
#' @param padding Specify what goes between the last character of one code block and the
#'     first character of the next code block. Default is a two new lines, which appears
#'     visually as one new line between code blocks.
#'
#' @return A character vector of length 1 containing the R code from the target url.
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#' @importFrom utils file.edit
#'
#' @export
#'
#' @examples
#' \donttest{
#' library(dplyr)
#' paste0("https://www.r-bloggers.com/how-to-create-a-bar-",
#' "chart-race-in-r-mapping-united-states-city-population-1790-2010/") %>%
#' r_bloggers
#'
#' # Same as above but provided to cat for easy viewing
#' paste0("https://www.r-bloggers.com/how-to-create-a-bar-",
#' "chart-race-in-r-mapping-united-states-city-population-1790-2010/") %>%
#' r_bloggers %>% cat
#' }
#'



r_bloggers <- function(url, method, padding = "\n\n") {

  url %>% read_html %>% html_nodes('.highlight') %>% html_text

}

