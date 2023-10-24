# uob-cs-exam

University of Bristol CS Exam template. Hopefully compatible with both Windows and Linux/Unix.

Based on a template first put together by Martijn Stam and Nicolas Wu in 2017/18.

Cover page ('rubric page') prepared according to 2023/24 regulations given by the exams office at

  http://www.bristol.ac.uk/directory/exams/staff/exam-papers/


Requires `xelatex` and `latexmk`. Both come by default with e.g. MikTeX.

## On `latexmk`

The repo comes with a `latexmkrc` file which specifies certain options that
`latexmk` must use. In particular, to get the auto-counting of marks and
questions to work
* we must use `xelatex`
* we must use force mode (`-f`)

All of these will be automatically picked up by the `latexmk` script from the
`latexmkrc` file.

## On `mlmodern`

This template uses a slightly boldened version of Latin Modern which is less
'spindly' than the default one. This makes it look more like the original design
of Donald Knuth's Computer Modern, as it used to be printed in the 1980s.

This is achieved by importing the
[mlmodern](https://ctan.org/pkg/mlmodern?lang=en) package.

If this font does not work with your TeX distribution, go into `uob-cs-exam.cls`
and comment out the line 

```
\usepackage{mlmodern}
```

e.g. by inserting a `%` before it.

## Compilation
### Windows

To compile under Windows, run
```
build.ps1 exam.tex
```
where `exam.tex` is the exam file. This will create a file `exam-answers.tex`
with solutions printed, and compile both to `pdf`.

### Linux/Unix

To compile on a Linux/Unix system, run
```
make exam.tex
make exam-answers.tex
```
where `exam.tex` is the exam file. This will create a file `exam-answers.tex`
with solutions printed, and compile both to `pdf`.

Currently `make all` runs the above two commands, i.e. assumes that
`exam.tex` is the source file in use.
