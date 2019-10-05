#' Retrieve raw R code from a datacamp tutorial
#'
#'
#' @name datacamp
#'
#' @usage datacamp(url, method, padding)
#'
#' @param url Link to datacamp tutorial
#' @param method Not all websites are formatted consistently. To overcome this, try a different
#'     method by setting the method
#'     parameter to integers 2 and greater to try other available methods
#' @param padding Specify what goes between the last character of one code block and the
#'     first character of the next code block. Default is a two new lines, which appears
#'     visually as one new line between blocks.
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
#' datacamp("https://www.datacamp.com/community/tutorials/sentiment-analysis-R")
#' datacamp("https://www.datacamp.com/community/tutorials/R-nlp-machine-learning")
#'
#' # Same as above but provided to cat for easy viewing
#' datacamp("https://www.datacamp.com/community/tutorials/sentiment-analysis-R") %>%
#'   cat
#' datacamp("https://www.datacamp.com/community/tutorials/R-nlp-machine-learning") %>%
#'   cat
#'
#' # If datacamp() doesn't return a sensible result, try another method
#' "https://www.datacamp.com/community/tutorials/keras-r-deep-learning" %>% datacamp(.) %>% cat
#' # no result
#'
#' # Let's try another method
#' "https://www.datacamp.com/community/tutorials/keras-r-deep-learning" %>%
#'    datacamp(method = 2) %>%
#'    cat # from inspection of output we see this method returns code correctly
#'
#' # Note that rawr::rawr() has the same capability
#'  "https://www.datacamp.com/community/tutorials/keras-r-deep-learning" %>%
#'    rawr(method = 2) %>% cat
#'
#' }
#'


datacamp <- function(url, method = 1, padding = "\n\n") {

  page_html <- xml2::read_html(url)

  if(method == 1) {

    if(missing(padding)) { padding = "\n\n" }

    page_html %>% gsub("\\{r\\}", "r", .) %>% read_html %>%
    html_nodes(".lang-r") %>% html_text %>% paste0(collapse=padding)

  }else if(method == 2) {

    if(missing(padding)) { padding = "\n\n" }

    page_html %>% html_nodes(xpath="//div[@data-datacamp-exercise=true()]") %>% html_text %>%
      sapply(base64_dec) %>% sapply(rawToChar) %>%
      unname %>% sapply(fromJSON) %>%
      sapply(function(x) { x$sample }) %>% unname %>% paste0(collapse=padding)

  }




}


