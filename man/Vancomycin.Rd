\name{Vancomycin}
\alias{Vancomycin}
\docType{data}
\title{Antibiotic agar diffusion assay on 6 plates}
\description{An "Antibiotic agar diffusion assay",
  but using 6 plates instead of 1 plate with 36 responses.
}
% Data class C~
\usage{data("Vancomycin")}
% \details{Private communication.}
% \source{Private communication.}
% \references{Private communication.}
\examples{
data(Vancomycin); Data <- Vancomycin

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/Miscellaneous/data/Vancomycin.txt",
                             sep = "/"))
}
\keyword{datasets}
