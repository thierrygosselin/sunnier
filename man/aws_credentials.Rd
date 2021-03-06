% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aws_credentials.R
\name{aws_credentials}
\alias{aws_credentials}
\title{Generate the aws creadential files}
\usage{
aws_credentials(user = "ec2-user", credential.path = "~/.aws",
  aws.access.key.id, aws.secret.access.key, region = "us-east-1")
}
\arguments{
\item{user}{User of the credentials and home folder.
Default: \code{user = "ec2-user"}}

\item{credential.path}{The path of the credential files.
Default: \code{credential.path = "~/.aws"}}

\item{aws.access.key.id}{The aws access key id}

\item{aws.secret.access.key}{The aws secret access key}

\item{region}{Default: \code{region = "us-east-1"}}
}
\description{
Generate the aws creadential files
}
\author{
Thierry Gosselin \email{thierrygosselin@icloud.com}
}

