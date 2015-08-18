# runAssay.csh
cat Skeleton/Skeleton-xtable.Rnw | sed -e "s/Skeleton/$1/" | \
    sed -e  "s/plaXXX/pla$2/" > $1.Rnw
R CMD Sweave $1.Rnw
pdflatex $1
