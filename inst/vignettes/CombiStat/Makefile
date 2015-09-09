all:	Diphteria-byLabel-xtable.pdf \
	Diphteria-xtable.pdf \
	Diphteria.pdf \
	Erythromycin-xtable.pdf \
	Erythromycin.pdf \
	Erythropoietin-xtable.pdf \
	Erythropoietin.pdf \
	FactorIX-t-xtable.pdf \
	FactorIX-xtable.pdf \
	FactorIX.pdf \
	HeparinSodium-xtable.pdf \
	HeparinSodium.pdf \
	HeparinSodium_Error.pdf \
	HepatitisBvaccine-xtable.pdf \
	HepatitisBvaccine.pdf \
	HumanHepatitisAimmunoglobulin-xtable.pdf \
	HumanHepatitisAimmunoglobulin.pdf \
	IPV_CompleteData-xtable.pdf \
	IPV_CompleteData.pdf \
	IPV_Imputed-xtable.pdf \
	IPV_Imputed.pdf \
	InactivatedPoliomyelitisVaccine-xtable.pdf \
	InactivatedPoliomyelitisVaccine.pdf \
	InactivatedPoliomyelitisVaccine_Error.pdf \
	Nystatin-xtable.pdf \
	Nystatin.Rnw

# pdf:	$(patsubst %.Rnw,%.pdf,$(wildcard *.Rnw))

%.tex:  %.Rnw
	R CMD Sweave $*.Rnw

%.pdf:  %.tex
	pdflatex $* > $*.out

mkdirs:
	mkdir Logs
	mkdir Figures
	mkdir PdfLatex
	mkdir Pdf
	mkdir Tex

move:
	mv *.out *.log *.aux *~ Logs
	mv *-xtable.pdf *-tabularx.pdf PdfLatex
	mv *00?.pdf Figures
	mv *.pdf Pdf
	mv *.tex Tex

clean:
	rm *.pdf
