\name{Diphteria}
\alias{Diphteria}
\docType{data}
\title{Diphteria vaccine - Intradermal challenge}
\description{Example 01 - Three-dose parallel line assay;
  completely randomized; square transformation; explicit volume units,
  from CombiStats - EDQM, Council of Europe (\url{http://combistats.edqm.eu}).
}
\usage{data("Diphteria")}
% Data class E
\source{
  From CombiStats - EDQM, Council of Europe:
  \url{http://combistats.edqm.eu/images/stories/Examples/Diphtheria\%20intradermal.pdf}
}
\examples{
Example  <- "Example 1"
data(Diphteria); Data <- Diphteria

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/Diphteria.txt",
                             sep = "/"), fun = function(x) x^2,
                        rows = "Dilutions & Samples", columns = "Replicates")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)
}
\keyword{datasets}
