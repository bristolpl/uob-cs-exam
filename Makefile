exam := exam

lhs2TeX := lhs2TeX --poly

.PRECIOUS : %.tex

all : $(exam).pdf $(exam)-answers.pdf

%.tex : %.lhs *.lhs
	$(lhs2TeX) $< > $@

%-answers.tex : %.tex
	echo "\\PassOptionsToClass{answers}{exam}" > $*-answers.tex
	cat $*.tex >> $*-answers.tex

%.pdf : %.tex cs-uob-exam.cls
	latexmk $*.tex

clean :
	@latexmk -C 2>/dev/null
	@rm *-answers.tex *.pdf 2>/dev/null || true
