# Moumita Dey — CV

LaTeX sources for Moumita Dey's curriculum vitae and cover letter, built on the
[ModernCV and Cover Letter template](https://www.overleaf.com/latex/templates/moderncv-and-cover-letter-template/sttkgjcysttn)
(the `moderncv` document class).

## Files

| File | Purpose |
| --- | --- |
| `cv.tex` | The CV. Three pages. |
| `cover_letter.tex` | A cover letter matching the CV, with placeholders for the role and company. |
| `resources/photo.jpg` | Headshot used in the header of both documents. |
| `archive/` | The previous, hand-rolled two-column CV that this repository replaces. Kept for reference only; nothing here is compiled. |

## Building

Requires a TeX distribution that includes `moderncv` (on Debian/Ubuntu:
`texlive-latex-extra`).

```sh
make          # builds cv.pdf and cover_letter.pdf
make clean    # removes .aux/.log and friends
```

Or directly, running `pdflatex` twice so page numbering settles:

```sh
pdflatex cv.tex && pdflatex cv.tex
```

On Overleaf, upload the repository and set `cv.tex` as the main document.

## Customising

Both documents share a preamble — **if you change one, change the other**, so
the CV and the letter keep matching.

- **Overall look:** `\moderncvstyle{classic}`. Other options are `casual`,
  `banking`, `oldstyle`, `fancy` and `contemporary`. Changing this one word
  changes the entire layout.
- **Colour:** `\moderncvcolor{blue}` is overridden immediately afterwards by
  `\colorlet{color1}{slateblue}`, which reuses the slate blue (RGB 59, 77, 97)
  from the previous CV design. Delete the two `\colorlet` lines to fall back to
  a stock moderncv colour.
- **Density:** `\usepackage[scale=0.81]{geometry}` controls the margins. Lower
  values give wider margins and more pages.
- **LinkedIn / homepage:** commented-out `\social` and `\homepage` lines sit
  just below the personal data block in `cv.tex`; uncomment and fill them in.

The cover letter's recipient, position title and company name are marked with
`[bracketed placeholders]` — fill these in per application.
