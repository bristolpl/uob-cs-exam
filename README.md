# uob-cs-exam

University of Bristol CS Exam template. Hopefully compatible with both Windows and Linux/Unix.

Based on a template first put together by Martijn Stam and Nicolas Wu in 2017-2018.

Requires `xelatex` and `latexmk`. Both come by default with e.g. MikTeX.

## Windows

To compile under Windows, run
```
compile.bat exam.tex
````
where `exam.tex` is the exam file. This will create a file `exam-answers.tex` with solutions printed, and compile both to `pdf`.

## Linux/Unix

To compile on a Linux/Unix system, run
```
make exam.tex
make exam-answers.tex
```
where `exam.tex` is the exam file. This will create a file `exam-answers.tex` with solutions printed, and compile both to `pdf`.

Currently `make all` runs the above two commands, i.e. assumes that `exam.tex` is the source file in use.
