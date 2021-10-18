#' Retrieve raw R code tidytext tutorial
#'
#'
#' @name tidytext
#'
#' @usage tidytext(url, method, padding)
#'
#' @param url Link to tidytext tutorial
#' @param method Not all websites are formatted consistently. To overcome this, try a different
#'     method by setting the method
#'     parameter to integers 2 and greater to try other available methods
#' @param padding Specify what goes between the last character of one code block and the
#'     first character of the next code block. Default is a two new lines, which appears
#'     visually as one new line between codeblocks.
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
#'
#'\dontrun{
#' library(dplyr)
#'
#' constructed_url <- paste0("https://cran.r-project.org/web/packages/",
#'  "tidytext/vignettes/tidytext.html")
#' tidytext(constructed_url) %>%
#'   cat
#'}
#'


tidytext <- function(url, method, padding = "\n\n") {
  url %>% xml2::read_html(.) %>%
    html_nodes("code.sourceCode.r") %>%
    html_text %>%
    paste0(collapse=padding)
}


#' @rdname tidytext
#' @export
tidytextmining <- tidytext



