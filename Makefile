# Makefile
# Jeremy Singer
# 17 Oct 07

HOSTNAME=savu

all: outline.pdf

%.pdf : %.tex
	latexmk -pdf $<
ifeq ($(shell /bin/hostname | cut -f1 -d.), $(HOSTNAME))
	scp $@ sibu:public_html/a.pdf
endif

clean:
	rm -fr outline.pdf *.dvi *.out *.bbl *.aux *.log *.blg *.fls *.fdb_latexmk *.tmp *~
