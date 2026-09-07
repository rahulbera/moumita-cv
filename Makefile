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

# Tailored application letters live in applications/. Build one with e.g.
#   make applications/client-onboarding-zurich.pdf
# pdflatex runs from the repo root, so resources/photo resolves unchanged.
applications/%.pdf: applications/%.tex resources/photo.jpg
	$(LATEX) -output-directory=applications $<
	$(LATEX) -output-directory=applications $<

clean:
	rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz
	rm -f applications/*.aux applications/*.log applications/*.out
