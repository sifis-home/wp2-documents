#!/bin/bash

MD_FILES="brainstorming sifis-home-languages tools-description"
OUTPUT_DIR=../output/documents

# Create the output directory for docx and pdf files
mkdir -p $OUTPUT_DIR

# Create docx and pdf for the chosen documents
for MD_FILE in $MD_FILES
do
    pandoc -o $OUTPUT_DIR/$MD_FILE.docx $MD_FILE.md
    pandoc -o $OUTPUT_DIR/$MD_FILE.pdf $MD_FILE.md
done
