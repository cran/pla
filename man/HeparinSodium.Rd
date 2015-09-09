\name{HeparinSodium}
\alias{HeparinSodium}
\docType{data}
\title{Heparin Sodium - European Pharmacopoeia (1997), 2.7.5}
\description{
  Example 05 - Three-dose parallel line assay; completely randomized;
  custom transformation; explicit content notation,
  from CombiStats - EDQM, Council of Europe (\url{http://combistats.edqm.eu}).
}
\usage{data("HeparinSodium")}
% Data class E~
% \format{Similar to \link{Diphteria}.}
\source{
  From CombiStats - EDQM, Council of Europe:
  \url{http://combistats.edqm.eu/images/stories/Examples/Heparin\%20sodium.pdf}
}
\examples{
Example <- "Example 5"
data(HeparinSodium); Data <- HeparinSodium

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/HeparinSodium.txt",
                             sep = "/"),
                       fun = function(x) 
                          apply(array(x, dim = c(6, 2, 2)), c(1, 3), mean),
                       log = 10,
                       rows = "Dilutions & Samples", 
                       columns = "Inner & Replicates")

plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)
}
\keyword{datasets}
