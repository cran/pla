\name{assayTable2frame}
\alias{assayTable2frame}
\title{Expand table to matrix of measurements by variables -
  for \link{pla.fit} and \link{pla.plots}}
\description{
  A table, that is, a 2-dimensional array, with the responses of an
  experiment is transformed for into a matrix, a \code{data.frame},
  with rows for the individual measurements and columns the variables
  and factors of the assay - for \link{pla.fit} and \link{pla.plots}. 
}
\usage{
assayTable2frame(table,
                 dr = 2,
                 Z = log((1/dr)^(max(Dilution) - Dilution)),
                 byOrder = TRUE,
                 echoData = TRUE,
                 ...)
}
\arguments{
  \item{table}{ A table in an object of class \link{array}.
    This is here usually in this tool the result of
    \code{as.array} on the result of \link{readAssayTable}.
    % This is here usually in this tool the \code{table} slot of the
    % result of \link{readAssayTable}. 
  }
  \item{dr}{ The dilution ratio of the geometric dilution serie
    with equally spaced dilutions (constant ratio between
    any adjacent dilutions) on the logarithmic scale.
    See also \link{data2assayFrame}. } 
  \item{Z}{ The 'concentration', by default computed as
    \eqn{log((1/dr)^{(max(Dilution) - Dilution)})},
    where \code{Dilution} is dilution step.
    See also \link{data2assayFrame}. }
  \item{byOrder}{ If \code{TRUE} then the order of the columns
    defines the order and values of the dilution steps - for tables read
    by \link{readAssayTable} with the single repetition over several lines.
    If \code{FALSE} then the \code{'dose'} is extracted from the
    \link{dimnames} of the \code{table} and as well \code{Dilution}
    and \code{Z} is given this value. }
  \item{echoData}{ If \code{TRUE} then the data is shown with means,
    standard deviations and coefficients of variations of columns. }
  \item{...}{ For additional arguments. }
}
\details{
  This function is used on table of data read by \link{readAssayTable}.
  The table of responses is transformed into a \link{data.frame}
  with the relevant columns \code{Response}, \code{Dilution},
  \code{Sample}, and \code{Replicate}.
  The \code{rows} of the input \code{table} are \code{replicates},
  and the \code{columns} of the input \code{table} are the
  cross classification \code{samples} and \code{dilutions}.
}
\note{
  If, e.g., "1. form" of table layout is used for the input file, see
  \link{readAssayTable}:
  
  \code{Dilution} steps (and concentrations) are determined by the order
  of the columns in \code{table}, not the column-names of the table (by
  default) - for tables read with the single repetition over several lines. 
  Thus the value of the dose in the label of the columns of the table
  is ignored - if not the argument \code{byOrder} is set to
  \code{FALSE}.

  \code{Sample} names (and \code{"doses"}) are extracted from the
  second item of \link{dimnames} of the \code{table}.
  If this second component of the \link{dimnames} of the \code{table}
  does not contain text strings with the character \code{":"}, then the
  \code{sample} name is the first character of each name. 
  If the names contains the character \code{":"}, the \code{sample} name
  is the first item, when splitting according to \code{":"}.
  
  If \code{byOrder} is set to \code{TRUE} (default) then \code{Dilution}
  step is the index of the column of the dilutionstep among the columns
  for the \code{sample} in the table.

  If \code{byOrder} is set to \code{FALSE} then \code{"dose"} is the
  last item (when splitting according to \code{":"}) of each name of
  the header \link{dimnames} of the \code{table}. 

  - Similar, if the doses and/or samples are given in rows.
  
  The first meet \code{sample} in the \code{sample} column is the
  \code{reference} (by default) in \link{pla.fit} and \link{pla.plots}.
}
\value{
  A \link{data.frame} with rows of individual observations and
  columns of treatments, dilution step numbers,
  replicate numbers (blocks), response-values, etc.
}
\author{Jens Henrik Badsberg}
\examples{
data(HepatitisB); Data <- HepatitisB

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/PhEur/data/HepatitisB.txt",
                             sep = "/"), fun = log)
Frame  <- assayTable2frame(as.array(Data))
}
\keyword{ mich }
