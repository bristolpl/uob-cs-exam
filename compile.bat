@echo off
echo \PassOptionsToClass{answers}{exam} >"%~n1-answers.tex"
type "%~n1.tex" >> "%~n1-answers.tex"
latexmk "%~n1.tex" "%~n1-answers.tex"