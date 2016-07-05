#' @name aws_credentials
#' @title Generate the aws creadential files
#' @description Generate the aws creadential files
#' @param user User of the credentials and home folder.
#' Default: \code{user = "ec2-user"}
#' @param credential.path The path of the credential files.
#' Default: \code{credential.path = "~/.aws"}
#' @param aws.access.key.id The aws access key id
#' @param aws.secret.access.key The aws secret access key
#' @param region Default: \code{region = "us-east-1"}

#' @export
#' @rdname aws_credentials
#' @import stringi
#' @import dplyr
#' @importFrom  purrr walk
#' @author Thierry Gosselin \email{thierrygosselin@@icloud.com}




aws_credentials <- function(user = "ec2-user", credential.path = "~/.aws", aws.access.key.id, aws.secret.access.key, region = "us-east-1"){
  if (!dir.exists(credential.path)) {
    dir.create(credential.path)
  }

  # credentials file
  credentials <- file(stri_paste("/home/", user, "/.aws/", "credentials"), "w") # open the connection to the file
  writeLines(text = "[default]", con = credentials, sep = "\n")
  writeLines(text = stri_paste("aws_access_key_id = ", aws.access.key.id, sep = ""), con = credentials, sep = "\n")
  writeLines(text = stri_paste("aws_secret_access_key = ", aws.secret.access.key, sep = ""), con = credentials, sep = "\n")
  close(credentials) # close the connection

  # config file
  config <- file(stri_paste("/home/", user, "/.aws/", "config"), "w") # open the connection to the file
  writeLines(text = "[default]", con = config, sep = "\n")
  writeLines(text = "output = ENTER", con = config, sep = "\n")
  writeLines(text = stri_paste("region = ", region, sep = ""), con = config, sep = "\n")
  close(config) # close the connection

  # system(command = paste("chmod -R 660", " /home/", user, "/.aws/", sep = ""))
  # system(command = paste("chown -R ", user, ":", user, " /home/", user, "/.aws/", sep = ""))

}
