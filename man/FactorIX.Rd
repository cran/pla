\name{FactorIX}
\alias{FactorIX}
\docType{data}
\title{Factor IX - Coagulation}
\description{
  Example 03 - Four-dose parallel line assay; completely randomized;
  logarithmic transformation; explicit ratio notation,
  from CombiStats - EDQM, Council of Europe (\url{http://combistats.edqm.eu}).
 
}
\usage{data("FactorIX")}
% Data class E
% \format{Similar to \link{Diphteria}.}
\source{
  From CombiStats - EDQM, Council of Europe:
  \url{http://combistats.edqm.eu/images/stories/Examples/Factor\%20IX.pdf}
}
\examples{
Example <- "Example 3"
data(FactorIX); Data <- FactorIX

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/FactorIX.txt",
                             sep = "/"), fun = log10,
                       rows = "Dilutions & Samples", columns = "Replicates")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)
}
\keyword{datasets}
