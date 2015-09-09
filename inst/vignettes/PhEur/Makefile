all:	Agar-impute-xtable.pdf \
	Agar-invalid-xtable.pdf \
	Agar-missing-xtable.pdf \
	Agar-xtable.pdf \
	AntibioticAgarDiffusionAssay-xtable.pdf \
	AntibioticAgarDiffusionAssay.pdf \
	AntibioticTurbidimetric-xtable.pdf \
	AntibioticTurbidimetric.pdf \
	Corticotrophin-select-ST-xtable.pdf \
	Corticotrophin-select-ST.pdf \
	Corticotrophin-xtable.pdf \
	Corticotrophin.pdf \
	CorticotrophinST-xtable.pdf \
	CorticotrophinST.pdf \
	HepatitisB-B-xtable.pdf \
	HepatitisB-byLabel-W-xtable.pdf \
	HepatitisB-byLabel-xtable.pdf \
	HepatitisB-byOrder-W-xtable.pdf \
	HepatitisB-byOrder-xtable.pdf \
	HepatitisB-xtable.pdf \
	HepatitisB.pdf \
	HepatitisB_Error.pdf \
	HepatitisB_Missing-xtable.pdf \
	HepatitisB_Missing.pdf

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
