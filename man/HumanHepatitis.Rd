\name{HumanHepatitis}
\alias{HumanHepatitis}
\docType{data}
\title{Human Hepatitis A immunoglobulin - Elisa}
\description{
  Example 08 - Four-dose parallel line assay; completely randomized;
  square root transformation; explicit content notation,
  from CombiStats - EDQM, Council of Europe (\url{http://combistats.edqm.eu}).
}
\usage{data("HumanHepatitis")}
% Data class E+
% \format{Similar to \link{Diphteria}.}
\source{
  From CombiStats - EDQM, Council of Europe:
  \url{http://combistats.edqm.eu/images/stories/Examples/Hepatitis\%20A\%20Ig.pdf}
}
\examples{
Example <- "Example 8 "
data(HumanHepatitis); Data <- HumanHepatitis

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/HumanHepatitis.txt",
                             sep = "/"), fun = sqrt,
                       rows = "Dilutions & Samples", columns = "Replicates")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)
}
\keyword{datasets}
