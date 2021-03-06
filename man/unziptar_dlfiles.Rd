% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/postdl_templates.R
\name{unziptar_dlfiles}
\alias{unziptar_dlfiles}
\title{Unzip/Untar downloaded files}
\usage{
unziptar_dlfiles(dlfiles, chmod = FALSE)
}
\arguments{
\item{dlfiles}{A data.frame of files by platform and indicating
whether they were processed}

\item{chmod}{change the mode of the unarchived file/files to "755" so
they are executable on unix like systems.}
}
\value{
Returns a list of character vectors indicating files
    processed
}
\description{
Unzip/Untar downloaded files. Keeps the original zip file
}
\examples{
\dontrun{
ymlfile <- system.file("exdata", "sampleapp.yml", package="binman")
trdata <- system.file("testdata", "test_dlres.Rdata", package="binman")
load(trdata)
testthat::with_mock(
  `httr::GET` = function(...){
    test_llres
  },
  `base::dir.create` = function(...){TRUE},
  `utils::unzip` = function(zipfile, ...){zipfile},
  procyml <- process_yaml(ymlfile)
)
procyml
}
}
