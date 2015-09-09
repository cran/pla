\name{Erythromycin}
\alias{Erythromycin}
\docType{data}
\title{Erythromycin - Assay 1}
\description{
  Example 22 - Three-dose parallel line assay at three independent
  occasions; randomized block; symbolic notation,
  from CombiStats - EDQM, Council of Europe (\url{http://combistats.edqm.eu}).
}
% Data class C
\usage{data("Erythromycin")}
\source{
  From CombiStats - EDQM, Council of Europe:
  \url{http://combistats.edqm.eu/images/stories/Examples/Erythromycin.pdf}
}
\examples{
Example <- "Example 22"
data(Erythromycin); Data <- Erythromycin

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/Erythromycin.txt",
                             sep = "/"),
                       rows = "Block", columns = "Dilutions & Samples")
plaModel <- plaCRD(Data); plaModel
plots    <- plot(plaModel)
}
\keyword{datasets}
