\name{Turbidimetric}
\alias{Turbidimetric}
\docType{data}
\title{Antibiotic turbidimetric assay}
\description{5.1.3. FOUR-DOSE RANDOMIZED BLOCK DESIGN}
\usage{data("Turbidimetric")}
% Data class B
% \format{Similar to \link{Erythromycin}.}
\details{
  From Ph.Eur.:
  
  This assay is designed to assign a potency in international
  units per vial. The standard has an assigned potency of
  670 IU/mg. The test preparation has an assumed potency of
  20 000 IU/vial. On the basis of this information the stock
  solutions are prepared as follows. 16.7 mg of the standard
  is dissolved in 25 ml solvent and the contents of one vial
  of the test preparation are dissolved in 40 ml solvent. The
  final solutions are prepared by first diluting to 1/40 and
  further using a dilution ratio of 1.5. The tubes are placed
  in a water-bath in a randomized block arrangement (see
  Section 8.5). The responses are listed in Table 5.1.3.-I.
  Inspection of Figure 5.1.3.-I gives no rise to doubt the validity
  of the assumptions of normality and homogeneity of variance
  of the data. The standard deviation of S3 is somewhat high
  but is no reason for concern.
}
\source{
  % \url{http://lib.njutcm.edu.cn/yaodian/ep/EP5.0/05_general_texts/5.3.__statistical_analysis_of_results_of_biological_assays_and_tests/}
  The example can also be found at CombiStats - EDQM,
  Council of Europe (\url{http://combistats.edqm.eu}):
  \url{http://combistats.edqm.eu/content/view/188/199/}
}
\references{
  Chapter 5.3. Statistical analysis.
  In EUROPEAN PHARMACOPOEIA version 8.0, 2014; 607-635.
}
\examples{
data(Turbidimetric); Data <- Turbidimetric

Data <- readAssayTable(paste(system.file(package = "pla"),
                             "vignettes/PhEur/data/AntibioticTurbidimetric.txt",
                             sep = "/"))
plaModel <- plaRBD(Data,
                   assayTitle = "PhEur: Antibiotic turbidimetric assay")
plaModel
plots    <- plot(plaModel)
}
\keyword{datasets}
