#' Open contents in a new tempfile or file
#'
#'
#' @name output_to_file
#'
#' @usage output_to_file(content, file_path)
#'
#' @param content Some (text) content to go into the new file
#' @param file_path Specifies a file path and file name.
#'
#'
#' @import dplyr
#'
#' @export
#'
#' @examples
#'
#' \dontrun{
#' code_sample <- "#Sample code\nx <- 6\n2 * 2"
#' output_to_file(code_sample)
#'}
#'
#'
#'
#'

output_to_file <- function(content, file_path) {

  # if(missing(file_path)) {file_path = tempfile() }

  writeLines(content, con=file_path)
  file.edit(file_path)

}




