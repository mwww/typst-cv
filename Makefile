.PHONY: preview build watch

FONT_PATH = --font-path fonts

# Live preview in browser (LSP-powered, hot reload)
preview:
	tinymist preview $(FONT_PATH) cv.typ

# Watch and recompile to PDF on save
watch:
	typst watch $(FONT_PATH) cv.typ

# One-shot compile to PDF
build:
	typst compile $(FONT_PATH) cv.typ
