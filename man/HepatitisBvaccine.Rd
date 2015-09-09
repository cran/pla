\name{HepatitisBvaccine}
\alias{HepatitisBvaccine}
\docType{data}
\title{Hepatitis B vaccine}
\description{
  Example 07 - Five-dose parallel line assay; completely randomized;
  logarithmic transformation; explicit ratio notation,
  from CombiStats - EDQM, Council of Europe (\url{http://combistats.edqm.eu}).
}
\usage{data("HepatitisBvaccine")}
% Data class E
% \format{Similar to \link{Diphteria}.}
\source{
  EDQM Combistats:
  \url{http://combistats.edqm.eu/images/stories/Examples/Hepatitis\%20B.pdf}
}
\examples{
Example  <- "Example 7"
data(HepatitisBvaccine); Data <- HepatitisBvaccine

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/HepatitisBvaccine.txt",
                             sep = "/"), fun = log,
                       rows = "Dilutions & Samples", columns = "Replicates")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)
}
\keyword{datasets}
