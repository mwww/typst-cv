# typst-cv

A minimalist, component-based CV template for [Typst](https://typst.app).

## Structure

```
cv.typ           — layout: assembles sections in order
data.typ         — your content: personal info, experience, projects, etc.
theme.typ        — design tokens: fonts, colors, sizes, spacing
components/
  header.typ     — name, contact links, optional QR code
  section.typ    — titled section with a ruled divider
  entry.typ      — experience / education / project entry
  skill-group.typ — category + skill chip row
  publication.typ — academic publication entry
  footer.typ     — page footer with name and page number
fonts/           — local font files (referenced via --font-path)
```

**To customize your CV, edit only `data.typ`.** Everything else is template code.

## Usage

### Prerequisites

- [Typst](https://github.com/typst/typst) CLI (`brew install typst` or see the Typst docs)
- [tinymist](https://github.com/Myriad-Dreamin/tinymist) for live preview (optional)
- Fonts: **Atkinson Hyperlegible Next** and **JetBrains Mono** placed in a `fonts/` directory, or installed system-wide

### Commands

```sh
make build    # compile cv.typ → cv.pdf (one-shot)
make watch    # recompile on save
make preview  # live preview via tinymist (hot reload)
```

Or call Typst directly:

```sh
typst compile --font-path fonts cv.typ
typst watch   --font-path fonts cv.typ
```

## Customizing

### Personal info and content — `data.typ`

All CV content lives here. Edit the variables directly:

```typst
#let personal = (
  name: "YOUR NAME",
  email: "you@example.com",
  github: "yourhandle",      // handle only — URL is added automatically
  website: "yoursite.dev",   // domain only — https:// is added automatically
  location: "City, Country",
  qr-url: "https://yoursite.dev",  // encoded in the QR code; omit to hide it
)
```

Each section (`projects`, `experience`, `education`, `certifications`, `skills`) is a Typst array of records. Add, remove, or reorder items freely. All fields on each entry are optional except `title`.

### Styling — `theme.typ`

Adjust fonts, type scale, colors, and spacing by editing the design tokens in `theme.typ`. No component code needs to change.

## Dependencies

- [`cades:0.3.1`](https://typst.app/universe/package/cades) — QR code rendering (fetched automatically by Typst)
