#' @name copy_s3
#' @title Copy files from/to Amazon s3 drive.
#' @description Copy files from/to Amazon s3 drive.
#' @param x (string) Specific filename inside \code{from.folder} to copy
#' @param from.folder (path) The folder where the files are stored.
#' @param destination.folder (path) The destination folder.
#' @param include (character string) Include specific file type.
#' Default: \code{include = NULL}
#' @param folder (logical) Transfer the entire folder? Default: \code{folder = TRUE} will
#' uses aws \code{--recursive} option

#' @export
#' @rdname copy_s3
#' @importFrom stringi stri_join
#' @import dplyr
#' @importFrom  purrr walk
#' @author Thierry Gosselin \email{thierrygosselin@@icloud.com}


copy_s3 <- function(x, from.folder, destination.folder, include = NULL, folder = FALSE) {

  cat("###############################################################################\n")
  cat("############################## sunnier: copy_s3 ###############################\n")
  cat("###############################################################################\n")

  if (folder) {
    folder <- shQuote(" --recursive ")

    if (is.null(include)) {
      include <- ""
    } else {
      include <- stringi::stri_join(" --include ", shQuote(include))
    }


    from.path <- stringi::stri_join(from.folder, "/")
    destination.path <- stringi::stri_join(destination.folder, "/")

    command.paste <- stringi::stri_join("aws s3 cp ", from.path, " ", destination.path, folder, include)
    system(command = command.paste)

  } else {
    transfer_s3 <- function(x, from.folder, destination.folder, include){
      from.path <- stringi::stri_join(from.folder, "/", x)
      destination.path <- stringi::stri_join(destination.folder, "/", x)

      if (is.null(include)) {
        include <- ""
      } else {
        include <- stringi::stri_join(" --include ", shQuote(include))
      }

      command.paste <- stringi::stri_join("aws s3 cp ", from.path, " ", destination.path, include)
      system(command = command.paste)
      purrr::walk(.x = x, .f = transfer_s3, from.folder = from.folder, destination.folder = destination.folder, include = include)
    }
  }
  cat("################################# completed ###################################\n")
}
