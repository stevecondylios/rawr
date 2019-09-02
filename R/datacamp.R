#' Retrieve raw R code from a datacamp tutorial
#'
#'
#' @name datacamp
#'
#' @usage datacamp(url)
#'
#' @param url Link to datacamp tutorial
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#'
#' @export
#'
#' @examples
#' \dontrun{
#' datacamp("https://www.datacamp.com/community/tutorials/sentiment-analysis-R")
#' datacamp("https://www.datacamp.com/community/tutorials/R-nlp-machine-learning")
#'
#' # Same as above but provided to cat for easy viewing
#' datacamp("https://www.datacamp.com/community/tutorials/sentiment-analysis-R") %>%
#'   cat
#' datacamp("https://www.datacamp.com/community/tutorials/R-nlp-machine-learning") %>%
#'   cat
#'
#'}


datacamp <- function(url) {
  xml2::read_html(url) %>% gsub("\\{r\\}", "r", .) %>% read_html %>%
    html_nodes(".lang-r") %>% html_text %>% paste0(., collapse="\n")
}


