% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/export_required_packages.R
\name{export_required_packages}
\alias{export_required_packages}
\title{Export a table as csv file showing required packages and their urls}
\usage{
export_required_packages(
  compare_tb,
  export_path,
  verify_urls = FALSE,
  verify_url_proxy = NULL
)
}
\arguments{
\item{compare_tb}{Tibble output of compare_available_server.}

\item{export_path}{Directory path where output csv file will be written.}

\item{verify_urls}{Optional. If TRUE will check each download url exists and
populate a url_ok column in output with TRUE or FALSE.}

\item{verify_url_proxy}{Optional. Specify a proxy if needed to check urls.}
}
\value{
Tibble of the exported rows and columns.
}
\description{
Export a table as csv file showing required packages and their urls
}
\examples{
\dontrun{
available_long_tb <- available_packages_long()
request_tb <- search_requirements(available_long_tb, "fabletools")
server_tb <- existing_server_packages("my_server/R_Packages/R_3_6_3_Packages")
compare_tb <- compare_available_server(request_tb, server_tb)
request_tb <- export_required_packages(compare_tb, "C:/temp")
}
}
