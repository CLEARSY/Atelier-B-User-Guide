#!/bin/bash

echo "Generating PDF"
pandoc atelierb-user-guide.md -o atelierb-user-guide.pdf  \
    --pdf-engine=xelatex --from markdown --template "template.tex" \
    --include-before-body="signature.tex" \
    --filter pandoc-latex-environment \
    -M version="draft" \
    --listings --toc -N --variable toc-own-page=1 --variable titlepage=1
echo "Done"
