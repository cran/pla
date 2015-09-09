\name{HepatitisB}
\alias{HepatitisB}
\docType{data}
\title{An in-vitro assay of three hepatitis B vaccines against a standard}
\description{5.1.4. FIVE-DOSE MULTIPLE ASSAYWITH COMPLETELY RANDOMIZED DESIGN}
% Data class B~
\usage{data("HepatitisB")}
\details{
  From Ph.Eur.:
  
  3 independent two-fold dilution series of 5 dilutions were
  prepared from each of the vaccines. After some additional
  steps in the assay procedure, absorbance's were measured.
  They are shown in Table 5.1.4.-I.
  The logarithms of the optical densities are known to have
  a linear relationship with the logarithms of the doses. The
  mean responses of the ln-transformed optical densities are
  listed in Table 5.1.4.-II. No unusual features are discovered
  in a graphical presentation of the data.
}
\source{
  % \url{http://lib.njutcm.edu.cn/yaodian/ep/EP5.0/05_general_texts/5.3.__statistical_analysis_of_results_of_biological_assays_and_tests/}
  The example can also be found at CombiStats - EDQM,
  Council of Europe (\url{http://combistats.edqm.eu}):
  \url{http://combistats.edqm.eu/content/view/189/199/}
}
\references{
  Chapter 5.3. Statistical analysis.
  In EUROPEAN PHARMACOPOEIA version 8.0, 2014; 607-635.
}
\examples{
data(HepatitisB); Data <- HepatitisB

cbbPalette <- c("#000000", "#009E73", "#e79f00", "#9ad0f3",
                "#0072B2", "#D55E00", "#CC79A7", "#F0E442")

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/PhEur/data/HepatitisB.txt",
                             sep = "/"), fun = log)
plaModel <- plaCRD(Data,
                   assayTitle =
            "PhEur: HepatitisB; Three hepatitis B vaccines against a standard")
plaModel
plots    <- plot(plaModel)
}
\keyword{datasets}
