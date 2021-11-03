# uob-cs-exam

University of Bristol CS Exam template. Hopefully compatible with both Windows and *nix

Based on a template first put together by Martijn Stam and Nicolas Wu in 2017-2018.

Requires `xelatex` and `latexmk`. Both come by default with e.g. MikTeX.

## Windows

To compile under Windows, run
```
compile exam.tex
````
where `exam.tex` is the exam file. This will create a file `exam-answers.tex` with solutions included, and compile both to `pdf`.

## *nix

To compile on a *nix system, run
```
make exam.tex
make exam-answers.tex
```
where `exam.tex` is the exam file.
