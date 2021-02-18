#!/bin/bash

# Stops at the first error
set -e

MAIN_FILE=wp2-deliverable-2-1.md
MD_FILES="software-assessment.md security-privacy.md \
          privacy-and-security-assessment-techniques.md conclusion.md annex.md"
CITATIONS_FILENAME=citations
OUTPUT_FILENAME=wp2-deliverable-2.1
OUTPUT_DIR=../output/$OUTPUT_FILENAME

# Function to run pandoc command
function run-pandoc () {
    pandoc --filter=pandoc-citeproc --standalone \
           --csl transactions-on-computational-logic.csl \
           --bibliography $CITATIONS_FILENAME.bib \
           -o $OUTPUT_DIR/$OUTPUT_FILENAME.$1 \
           $MAIN_FILE $MD_FILES
}

# Create the output directory for docx and pdf files
mkdir -p $OUTPUT_DIR

# Copy markdown citations into a .bib file
cp $CITATIONS_FILENAME.md $CITATIONS_FILENAME.bib

# Remove first 5 lines of HackMD metadata
for MD_FILE in $MD_FILES
do
    cp $MD_FILE /tmp/$MD_FILE
    tail -n +5 $MD_FILE > $MD_FILE-new
    mv $MD_FILE-new $MD_FILE
done

# Compute docx file
run-pandoc docx

# Compute pdf file
run-pandoc pdf

# Get back original files from tmp
for MD_FILE in $MD_FILES
do
    mv /tmp/$MD_FILE .
done

# Delete .bib file
rm -rf $CITATIONS_FILENAME.bib
