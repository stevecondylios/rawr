#' Retrieve raw R code from a kaggle notebook
#'
#'
#' @name kaggle
#'
#' @usage kaggle(url)
#'
#' @param url Link to a kaggle notebook
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#'
#' @export
#'
#' @examples
#'
#' library(dplyr)
#' kaggle("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine")
#' kaggle("https://www.kaggle.com/captcalculator/a-very-extensive-mercari-exploratory-analysis")
#' kaggle("https://www.kaggle.com/adityaecdrid/mnist-with-keras-for-beginners-99457")
#'
#' # Same as above but provided to cat for easy viewing
#'
#' # R
#' kaggle("https://www.kaggle.com/vrtjso/mercari-eda-more-info-than-you-can-imagine")  %>%
#'   cat
#'
#' # rmarkdown
#' kaggle("https://www.kaggle.com/captcalculator/a-very-extensive-mercari-exploratory-analysis") %>%
#'   cat
#'
#' # python
#' kaggle("https://www.kaggle.com/adityaecdrid/mnist-with-keras-for-beginners-99457") %>%
#'   cat
#'


kaggle <- function(url) {

glob <- xml2::read_html(url) %>%
  html_nodes(xpath = "//div[@data-component-name = 'KernelViewer']/following::script") %>%
  .[1] %>% html_text %>%
  strsplit(., "State.push\\(") %>% .[[1]] %>% .[2]  %>%
  strsplit(., "\\);performance && performance.mark && performance.mark\\(\"KernelViewer.componentCouldBootstrap\"\\);") %>%
  .[[1]] %>% .[1] %>% fromJSON


if(glob$kernelRun$language == "rmarkdown") {

  language <- "rmarkdown"
  code <- glob$kernelRun$commit$source %>%
    paste0(., collapse="\n")
}else{

  source_code <- glob$kernelRun$commit$source %>% fromJSON

  language <- source_code$metadata$language_info$name
  list_indices_to_keep <- ifelse(source_code$cells$cell_type == "code", TRUE, FALSE)

  code <- source_code$cells$source[list_indices_to_keep] %>%
    lapply(function(x) { paste0(x, collapse="") }) %>%
    paste0(., collapse="\n")

}

code
}

