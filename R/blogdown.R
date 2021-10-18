#' Retrieve raw R code from a blogdown web page
#'
#'
#' @name blogdown
#'
#' @usage blogdown(url, method, padding)
#'
#' @param url Link to a blogdown web page
#' @param method Not all websites are formatted consistently. To overcome this, try a different
#'     method by setting the method
#'     parameter to integers 2 and greater to try other available methods
#' @param padding Specify what goes between the last character of one code block and the
#'     first character of the next code block. Default is a two new lines, which appears
#'     visually as one new line between code blocks.
#'
#' @return A character vector of length 1 containing the R code from the target url.
#'     Code from other languages (e.g. javascript, bash, or python) will also be returned if
#'     present.
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#' @importFrom utils file.edit
#'
#' @export
#'
#' @examples
#' \dontrun{
#' library(dplyr)
#' blogdown("https://www.jtimm.net/2019/04/14/lexical-change-procrustes/")
#'
#' # Same as above but provided to cat for easy viewing
#' blogdown("https://www.jtimm.net/2019/04/14/lexical-change-procrustes/")  %>%
#'   cat
#'}


blogdown <- function(url, method, padding = "\n\n") {
  url %>% xml2::read_html(.) %>%
    html_nodes("code") %>% html_text %>% paste0(collapse=padding)
}













