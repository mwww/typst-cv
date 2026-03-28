#import "../theme.typ": *
#import "@preview/cades:0.3.1": qr-code

// Usage:
//   #cv-header(
//     name: "JANE DOE",  // write in your preferred casing — stored as-is in the PDF
//     email: "jane@example.com",   // optional
//     github: "janedoe",           // optional — pass handle only
//     website: "janedoe.dev",      // optional — pass domain only
//     location: "New York, NY",    // optional
//     qr-url: "https://janedoe.dev", // optional — URL encoded in QR code
//   )
#let cv-header(
  name: "",
  email: "",
  github: "",
  website: "",
  location: "",
  qr-url: "",
) = {
  let contacts = ()
  if email    != "" { contacts.push(link("mailto:" + email)[#email]) }
  if github   != "" { contacts.push(link("https://github.com/" + github)[github.com/#github]) }
  if website  != "" { contacts.push(link("https://" + website)[#website]) }
  if location != "" { contacts.push(location) }

  // ── Two-column layout: left = name + rule + contacts, right = QR ──
  grid(
    columns: (1fr, auto),
    column-gutter: 1.5em,
    align: (bottom, center),
    // Left: full header content
    {
      // NOTE: write name in your desired casing — it is stored as-is in the PDF (ATS-safe)
    // NOTE: keep qr-url short (under ~80 chars) for best QR scannability
    text(font: font-name, size: size-name, weight: "bold", stroke: 0.5pt + black, name)
      v(0.3em)
      line(length: 100%, stroke: stroke-heavy)
      v(0.55em)
      text(font: font-mono, size: size-meta, contacts.join([#h(0.6em)·#h(0.6em)]))
    },
    // Right: QR code (omitted if no URL given)
    if qr-url != "" { qr-code(qr-url, width: 2cm) },
  )
  v(gap-after-header)
}
