copy_s3 <- function(x, from.folder, destination.folder, include, folder) {

  if (folder) folder <- shQuote(" --recursive ")
  if (!is.null(include)) {
    from.path <- stri_paste(from.folder, "/")
    destination.path <- stri_paste(destination.folder, "/")
    command.paste <- stri_paste("aws s3 cp ", from.path, " ", destination.path, " --include ", shQuote(x))
    system(command = command.paste)
  } else {
    transfer_s3 <- function(x, from.folder, destination.folder, include){
      from.path <- stri_paste(from.folder, "/", x)
      destination.path <- stri_paste(destination.folder, "/", x)
      command.paste <- stri_paste("aws s3 cp ", from.path, " ", destination.path)
      system(command = command.paste)
      purrr::walk(.x = x, .f = transfer_s3, from.folder = from.folder, destination.folder = destination.folder, include = include)
    }
  }
}
