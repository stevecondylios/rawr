#' Retrieve raw R code from Stack Overflow website
#'
#'
#' @name stackoverflow
#'
#' @usage stackoverflow(url, method, padding)
#'
#' @param url Link to a page on Stack Overflow website (or any Stack Exchange)
#' @param method Not all websites are formatted consistently. To overcome this, try a different
#'     method by setting the method
#'     parameter to integers 2 and greater to try other available methods
#' @param padding Specify what goes between the last character of one code block and the
#'     first character of the next code block. Default is a two new lines, which appears
#'     visually as one new line between code blocks.
#'
#' @return A character vector of length 1 containing the R code from the target url. All code
#'    at the target url (including javascript, ruby, python) will be returned.
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
#' stackoverflow("https://stackoverflow.com/questions/58248102/date-input-dt-r-shiny")
#'
#' # Same as above but provided to cat for easy viewing
#' stackoverflow("https://stackoverflow.com/questions/58248102/date-input-dt-r-shiny") %>%
#'   cat
#'}
#'


stackoverflow <- function(url, method, padding = "\n\n") {

  url %>% xml2::read_html(.) %>%
    html_nodes("code") %>% html_text %>% paste0(collapse=padding)

}














