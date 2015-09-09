\name{Nystatin}
\alias{Nystatin}
\docType{data}
\title{Nystatin: Antibiotic agar diffusion assay}
\description{Example 15 - Three-dose parallel line assay;
  latin square; explicit ratio notation,
  from CombiStats - EDQM, Council of Europe (\url{http://combistats.edqm.eu}).
  5.1.2. THREE-DOSE LATIN SQUARE DESIGN
}
\usage{data("Nystatin")}
\details{The data is the same as \link{AgarDiffusionAssay},
  but here with CombiStats as source, and put into an object. }
\source{
  From CombiStats - EDQM, Council of Europe:
  \url{http://combistats.edqm.eu/images/stories/Examples/Nystatin.pdf}
  
}
\examples{
Example <- "Example 15"
data(Nystatin); Data <- Nystatin

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/CombiStat/data/Nystatin.txt",
                             sep = "/"),
                       rows = "Measurements", 
                       columns = "All factors and variables")
plaModel <- plaLSD(Data)
Fits     <- fit(plaModel)
plots    <- plot(plaModel)
}
\keyword{datasets}
