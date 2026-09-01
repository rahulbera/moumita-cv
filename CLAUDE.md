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
  `scale=0.82` is load-bearing: at `0.81` the three-line Systems section
  splits and orphans its "Productivity" line onto page 3. Check both the
  page count and the page-2/3 break after any content change — this kind of
  orphan reappears easily.
- **Don't invent CV content.** Employment history, dates, certifications
  and qualifications are matters of fact. Reword and reformat freely, but
  new facts come from Moumita, not from Claude.
- `archive/` is frozen. Read it for provenance; don't edit or compile it.

## Open questions

- **Axis Bank dates.** `cv.tex` follows the old `archive/Master1.tex`: one
  combined `Jul 2016 -- Sep 2022` entry, and HDFC from Oct 2022. The older
  `archive/employment.tex` disagrees — it splits Axis into Deputy Manager
  (Jul'19 -- Sept'22) and Assistant Manager (Oct'16 -- Jul'19) and dates
  HDFC from Sept'22. Unresolved; ask before changing.
