#' Read Dataset in txt, xlsx, or xls Format
#'
#' @description Read a dataset from a specified file path in
#' `txt`(separated by space), `xlsx`, or `xls` format and return a `data.frame`.
#'
#' @param path The path to the folder where the dataset is located.
#'
#' @param col.names `Logical` value indicating whether the first row
#' of the dataset should be used as column names. Default is `FALSE`.
#'
#' @param col.types Character or a character vector specifying
#' the data types for each column: "skip", "guess", "logical", "numeric",
#' "date", "text", or "list". By default, it is `NULL`, which means the
#' data types will be determined automatically. Note that `txt` files do not
#' support parameter `col.types`.
#'
#' @return A dataset in `data.frame` format.
#'
#' @export
#'
#'
#' @examples
#' # Load the package
#' library(hclusteasy)
#'
#' # Set the file path
#' file_path <- system.file("extdata",
#'                           "iris.xlsx",
#'                            package = "hclusteasy")
#'
#'
#' # Read a XLSX dataset
#' data <- read.data(file_path,col.names = TRUE)
#'
#' @importFrom readxl read_xlsx read_xls
#' @importFrom utils read.table
read.data <- function(path, col.names = FALSE, col.types = NULL) {
  # Dataset format
  format <- tolower(tools::file_ext(path))

  # Read dataset
  if (format == "xlsx") {
    data <- read_xlsx(path, col_names = col.names, col_types = col.types)
  } else if (format == "xls") {
    data <- read_xls(path, col_names = col.names, col_types = col.types)
  } else if (format == "txt") {
    if (!(is.null(col.types))) {
      warning("txt data format does not support editing column types.")
    }
    if (is.logical(col.names)) {
      data <- read.table(path, header = col.names, sep = " ")
    } else if (is.character(col.names)) {
      data <- read.table(path, col.names = col.names, sep = " ")
    }
  } else {
    stop(paste("Unsupported", format, "data format. Please use txt, xlsx, or xls format."), call. = FALSE)
  }

  data <- data.frame(data)

  return(data)
}
