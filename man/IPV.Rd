\name{IPV}
\alias{IPV}
\docType{data}
\title{Inactivated poliomyelitis vaccine - Type 3}
\description{
  Example 10 - Four-dose parallel line assay; completely randomized;
  logarithmic transformation; explicit ratio notation,
  from CombiStats - EDQM, Council of Europe (\url{http://combistats.edqm.eu}).
}
\usage{data("IPV")}
% Data class E
% \format{Similar to \link{Diphteria}.}
\source{
  From CombiStats - EDQM, Council of Europe:
  \url{http://combistats.edqm.eu/images/stories/Examples/IPV.pdf}
}
\examples{
Example <- "Example 10"
data(IPV); Data <- IPV

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/IPV.txt",
                             sep = "/"), fun = log10,
                       rows = "Dilutions & Samples", columns = "Replicates")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)
}
\keyword{datasets}
