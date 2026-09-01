# Build the CV and the cover letter.
#
#   make          -> build both PDFs
#   make cv       -> build cv.pdf only
#   make letter   -> build cover_letter.pdf only
#   make clean    -> remove LaTeX build artefacts (keeps the PDFs)

LATEX = pdflatex -interaction=nonstopmode -halt-on-error

.PHONY: all cv letter clean

all: cv letter

cv: cv.pdf
letter: cover_letter.pdf

# Run twice so the "page n of m" numbering settles.
%.pdf: %.tex resources/photo.jpg
	$(LATEX) $<
	$(LATEX) $<

clean:
	rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz
