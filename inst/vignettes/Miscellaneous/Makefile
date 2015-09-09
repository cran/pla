all:	ToothGrowth-xtable.pdf \
	ToothGrowth.pdf \
	Vancomycin-CompleteData-xtable.pdf \
	Vancomycin-Impute-1-xtable.pdf \
	Vancomycin-Impute-2-xtable.pdf \
	Vancomycin-Impute-Frame-xtable.pdf \
	Vancomycin-Impute-xtable.pdf \
	Vancomycin-tabularx.pdf \
	Vancomycin-xtable.pdf \
	Vancomycin.pdf \
	Vancomycin_check-xtable.pdf

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
