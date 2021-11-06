@echo off
if not exist "%~n1.tex" (
  echo file %~n1.tex does not exist
  exit 1
)
echo \PassOptionsToClass{answers}{exam} >"%~n1-answers.tex"
type "%~n1.tex" >> "%~n1-answers.tex"
latexmk "%~n1.tex" "%~n1-answers.tex"