@echo off
SET spath=%~sp0
SET dpath=%~dp0

set /p assayName=Enter assayname (in %dpath%\data, name of file without extension): 
set dataPath=data

set /p design=Enter RBD, CRD or LSD (or return to find from data): || set design=
If "%design%"=="" goto :name
If "%design%"=="RBD" goto :name
If "%design%"=="CRD" goto :name
If "%design%"=="LSD" goto :name
goto :exit

:name
SET pladesign=pla%design%

IF EXIST %dataPath%\%assayName%.txt (
  REM del %assayname%.*
  %spath%BatchSubstitute.bat "Skeleton" %assayname% Skeleton\Skeleton-xtable.Rnw > %assayName%_1.Rnw
  %spath%BatchSubstitute.bat plaXXX %pladesign% %assayname%_1.Rnw > %assayname%.Rnw
  del %assayname%_1.Rnw
  R CMD Sweave %assayname%.Rnw
  IF EXIST %assayname%.tex  (
    pdflatex %assayname% > %assayname%.out
    start "Reading PDF" /wait "%assayName%.pdf"
    del %assayname%.out
    del %assayname%.tex
    del %assayname%.aux
    del %assayname%.log
  ) ELSE (
    echo Computation of results aborted!
  )
) ELSE (
  echo Datafile for assay does not exist!
)

set /p assayName=Enter to exit
:exit
