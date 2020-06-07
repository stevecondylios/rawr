
#' Retrieve raw R code from any github, kaggle, stack overflow, blogdown, or data camp web page
#'
#'
#' @name rawr_to_clip
#'
#' @usage rawr_to_clip(url, method, padding)
#'
#' @param url Link to an R file on supported website (github, kaggle, datacamp, tidytext)
#' @param method Not all websites are formatted consistently. To overcome this, rawr may have
#'     more than one method for any site. If what rawr returns is not sensible, try setting method
#'     parameter to integers 2 and greater to try other available methods
#' @param padding Specify what goes between the last character of one code block and the
#'     first character of the next code block. Default is a two new lines, which appears
#'     visually as one new line between code blocks.
#'
#' @return The raw R code from the URL provided written to the system clipboard (and so can be
#'     pasted in the usual way with ctrl + v / cmd + v). No object is returned to the R interpreter.
#'
#' @import dplyr jsonlite xml2
#' @importFrom rvest html_nodes html_text html_attr
#' @importFrom clipr write_clip
#'
#' @export
#'
#' @examples
#' \donttest{
#'
#' library(dplyr)
#' rawr_to_clip("https://cran.r-project.org/web/packages/tidytext/vignettes/topic_modeling.html")
#'
#' # Also works with the magrittr pipe
#' "https://github.com/hadley/vis-eda/blob/master/travel.R" %>% rawr_to_clip
#' }
#'




rawr_to_clip <- function(url, method = 1, padding = "\n\n") {

  url %>% rawr %>% write_clip(., )

}




