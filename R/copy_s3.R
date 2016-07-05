#' @name copy_s3
#' @title Copy files from/to Amazon s3 drive.
#' @description Copy files from/to Amazon s3 drive.
#' @param x Filename inside the \code{from.folder} to copy
#' @param from.folder
#' @param destination.folder
#' @param include To include certain type of files
#' @param folder To transfer entire folder uses aws --recursive option

#' @export
#' @rdname copy_s3
#' @import stringi
#' @import dplyr
#' @author Thierry Gosselin \email{thierrygosselin@@icloud.com}


copy_s3 <- function(x, from.folder, destination.folder, include, folder) {

  cat("###############################################################################\n")
  cat("############################## sunnier: copy_s3 ###############################\n")
  cat("###############################################################################\n")

  if (!is.null(folder)) {
    folder <- shQuote(" --recursive ")

    if (is.null(include)) {
      include <- ""
    } else {
      include <- stri_paste(" --include ", shQuote(include))
    }


    from.path <- stri_paste(from.folder, "/")
    destination.path <- stri_paste(destination.folder, "/")

    command.paste <- stri_paste("aws s3 cp ", from.path, " ", destination.path, folder, include)
    system(command = command.paste)

  } else {
    transfer_s3 <- function(x, from.folder, destination.folder, include){
      from.path <- stri_paste(from.folder, "/", x)
      destination.path <- stri_paste(destination.folder, "/", x)

      if (is.null(include)) {
        include <- ""
      } else {
        include <- stri_paste(" --include ", shQuote(include))
      }

      command.paste <- stri_paste("aws s3 cp ", from.path, " ", destination.path, include)
      system(command = command.paste)
      purrr::walk(.x = x, .f = transfer_s3, from.folder = from.folder, destination.folder = destination.folder, include = include)
    }
  }
  cat("################################# completed ###################################\n")
}
