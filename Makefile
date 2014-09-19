TEX = pdflatex -interaction=nonstopmode
BIB = bibtex
FILENAME = thesis
INDEX = ""  # if you use index, set INDEX = "makeindex"

.PHONY: all clean

all: $(FILENAME)

$(FILENAME): $(FILENAME).tex
	$(TEX) $(FILENAME)
	$(BIB) $(FILENAME)
	$(TEX) $(FILENAME)
	$(TEX) $(FILENAME)
	@if [ $(INDEX) != "" ]; then\
		$(INDEX) $(FILENAME);\
		$(TEX) $(FILENAME);\
	fi

clean:
	rm -f *.aux *.out *.log *.pdf *.bbl *.blg *.idx *.ilg *.ind *.toc *.lof \
		*.lot
