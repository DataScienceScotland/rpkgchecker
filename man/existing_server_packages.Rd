% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/existing_server_packages.R
\name{existing_server_packages}
\alias{existing_server_packages}
\title{Package name and version from a directory of package installs/}
\usage{
existing_server_packages(server_package_dir)
}
\arguments{
\item{server_package_dir}{String specifying the directory to search.}
}
\value{
Tibble with columns of package names and package versions.
}
\description{
Package name and version from a directory of package installs/
}
\examples{
\dontrun{
existing_server_packages("//my_server/R_Packages/R_3_6_3_Packages")
}
}
