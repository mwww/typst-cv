#import "../theme.typ": *

// Usage:
//   #cv-section(title: "Experience")[
//     #cv-entry(...)
//     #cv-entry(...)
//   ]
#let cv-section(title: "", body) = {
  v(gap-before-section)
  text(
    font: font,
    size: size-section,
    weight: "bold",
    upper(title),
  )
  v(0.25em)
  line(length: 100%, stroke: stroke-light)
  v(gap-after-section)
  body
}
