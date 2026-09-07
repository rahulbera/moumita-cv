# CLAUDE.md

Guidance for Claude Code when working in this repository.

## What this repo is

LaTeX sources for Moumita Dey's CV and cover letter, built on the
[ModernCV and Cover Letter template](https://www.overleaf.com/latex/templates/moderncv-and-cover-letter-template/sttkgjcysttn)
(the `moderncv` document class). It replaced an earlier hand-rolled
two-column `paracol`/`tikz` layout, which is kept under `archive/` for
reference only and is not compiled.

There is no application code here — the deliverables are `cv.pdf` and
`cover_letter.pdf`, and both are committed alongside their sources.

## Workflow

**Push whenever a change is done.** Commit and push to
`claude/cv-design-opsne6` as soon as a change is complete and verified —
do not wait to be asked. Do not push to any other branch, and do not open
a pull request, without asking first.

**Verify before pushing.** Always confirm the documents actually build:

```sh
make          # builds cv.pdf and cover_letter.pdf
make clean    # removes .aux/.log and friends
```

`make` runs `pdflatex` twice per document so the "page n of m" numbering
settles. Requires a TeX distribution including `moderncv` (on
Debian/Ubuntu: `texlive-latex-extra`; `lmodern` is also needed, since
moderncv's `sans` option aborts on bitmap fonts). Rebuild the PDFs and
commit them along with any source change, so the committed PDFs never
lag the sources.

## Conventions

- **Keep the two preambles in sync.** `cv.tex` and `cover_letter.tex`
  duplicate their preamble and personal-data block on purpose, so the two
  documents look identical. A change to one almost always belongs in the
  other: style, colour, geometry scale, `\hintscolumnwidth`, name, phone,
  email, photo.
- **Layout knobs**, all in the preamble: `\moderncvstyle{classic}`
  (alternatives: `casual`, `banking`, `oldstyle`, `fancy`,
  `contemporary`), `\colorlet{color1}{cvblue}` overriding
  `\moderncvcolor{blue}` with RGB 21, 76, 143, and
  `\usepackage[scale=0.82]{geometry}` for density. The heading colour needs
  enough saturation to read as blue next to black body text — the original
  slate (RGB 59, 77, 97, carried over from the previous design) was too
  desaturated and looked black in print.
  `scale=0.82` is a density preference, not a constraint: page breaks are
  now held by `\cvsection`, a `\needspace` wrapper around moderncv's
  `\section`. moderncv reserves no space before a heading, so a heading
  could strand at the foot of a page with its entries overleaf; the wrapper
  demands room for the heading plus a first entry, or moves the section
  over. **Use `\cvsection`, not `\section`, for new sections.** Still worth
  checking the page count and the page-2/3 break after a content change.
- **Don't invent CV content.** Employment history, dates, certifications
  and qualifications are matters of fact. Reword and reformat freely, but
  new facts come from Moumita, not from Claude.
- `archive/` is frozen. Read it for provenance; don't edit or compile it.

## Settled facts

Moumita has confirmed the CV is the source of truth for dates, over both
`archive/employment.tex` and her LinkedIn profile:

- **HDFC Bank ran Oct 2022 -- Feb 2023.** Her LinkedIn said December 2023;
  that is wrong and she is correcting it there. This leaves a real gap of
  roughly Mar -- Nov 2023, which she took as a caregiving career break. The
  break is recorded on LinkedIn, deliberately not on the CV.
- **Axis Bank stays one combined entry, `Jul'16 -- Sep'22`.** Her LinkedIn
  splits it into Deputy Manager and Assistant Manager and starts it in
  Oct 2016; she is aligning LinkedIn to the CV rather than the reverse.

Still open, and hers alone to decide: whether "nearly 9 years" in the
profile should become "8+ years" now that the gap is confirmed.
