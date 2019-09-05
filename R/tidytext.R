#' Retrieve raw R code tidytext tutorial
#'
#'
#' @name tidytext
#'
#' @usage tidytext(url)
#'
#' @param url Link to tidytext tutorial
#'
#' @return A character vector of length 1 containing the R code from the target url.
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#'
#' @export
#'
#' @examples
#' library(dplyr)
#' tidytext("https://www.tidytextmining.com/sentiment.html")
#'
#' # Same as above but provided to cat for easy viewing
#' tidytext("https://www.tidytextmining.com/sentiment.html") %>%
#'   cat
#'
#'


tidytext <- function(url) {
  url %>% xml2::read_html(.) %>%
    html_nodes("code.sourceCode.r") %>%
    html_text %>%
    paste0(., collapse="\n")
}


#' @rdname tidytext
#' @export
tidytextmining <- tidytext



