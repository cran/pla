\name{AgarDiffusionAssay}
\alias{AgarDiffusionAssay}
\docType{data}
\title{Antibiotic agar diffusion assay using a rectangular tray}
\description{5.1.2. THREE-DOSE LATIN SQUARE DESIGN}
\usage{data("AgarDiffusionAssay")}
% Data class A
\details{
  From Ph.Eur.:
  
  The standard has an assigned potency of 4855 IU/mg. The
  test preparation has an assumed potency of 5600 IU/mg.
  For the stock solutions 25.2 mg of the standard is dissolved
  in 24.5 ml of solvent and 21.4 mg of the test preparation
  is dissolved in 23.95 ml of solvent. The final solutions are
  prepared by first diluting both stock solutions to 1/20 and
  further using a dilution ratio of 1.5.
  A Latin square is generated with the method described
  in Section 8.6 (see Table 5.1.2.-I). The responses of this
  routine assay are shown in Table 5.1.2.-II (inhibition zones
  in mm x 10). The treatment mean values are shown in
  Table 5.1.2.-III. A graphical representation of the data (see
  Figure 5.1.2.-I) gives no rise to doubt the normality or
  homogeneity of variance of the data.
}
\source{
  % \url{http://lib.njutcm.edu.cn/yaodian/ep/EP5.0/05_general_texts/5.3.__statistical_analysis_of_results_of_biological_assays_and_tests/}
  The example can also be found at CombiStats - EDQM,
  Council of Europe (\url{http://combistats.edqm.eu}):
  \url{http://combistats.edqm.eu/content/view/187/199/}
}
\references{
  Chapter 5.3. Statistical analysis.
  In EUROPEAN PHARMACOPOEIA version 8.0, 2014; 607-635.
}
\examples{
data(AgarDiffusionAssay); Agar <- AgarDiffusionAssay
Agar <- read.table(paste(system.file(package = "pla"),
                   "vignettes/PhEur/data/AntibioticAgarDiffusionAssay.txt",
                   sep = "/"), header = TRUE)
select   <- c("Row", "Column", "Sample", "Dilution", "Response")
PHframe  <- data2assayFrame(Agar[, select])
plaModel <- pla(Agar, design = "lsd",
                assayTitle = "PhEur: Antibiotic agar diffusion assay")
plots    <- plot(plaModel, plots = "all", mfrow = c(3, 4))
}
\keyword{datasets}
