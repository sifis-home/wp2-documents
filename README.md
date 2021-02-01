## WP2-Deliverables

This repository saves and renders the WP2 Deliverables and some other documents
into the `Docx` and `PDF` formats automatically.

## Render PDF

```
pandoc --filter=pandoc-citeproc --standalone --csl citation-style.csl --bibliography bibliography.bib -o document.pdf document.md
```

## Render Docx

```
pandoc --filter=pandoc-citeproc --standalone --csl citation-style.csl --bibliography bibliography.bib -o document.docx document.md
```

## Citation Styles

[Zotero](https://www.zotero.org/styles citation styles)
