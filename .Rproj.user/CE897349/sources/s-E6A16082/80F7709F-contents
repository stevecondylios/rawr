#' Retrieve raw R code tidytext tutorial
#'
#'
#' @name tidytext
#'
#' @usage tidytext(url)
#'
#' @param url Link to tidytext tutorial
#'
#' @import rvest dplyr stringr jsonlite xml2
#'
#' @export
#'
#' @examples
#' \dontrun{
#' tidytext("https://www.tidytextmining.com/sentiment.html")
#'
#' # Same as above but provided to cat for easy viewing
#' tidytext("https://www.tidytextmining.com/sentiment.html") %>%
#'   cat
#'
#'}


tidytext <- function(url) {
  url %>% xml2::read_html(.) %>%
    html_nodes("code.sourceCode.r") %>%
    html_text %>%
    paste0(., collapse="\n")
}
