#!/bin/bash

# Stops at the first error
set -e

# The order is important here!
MD_FILES="developer-guidelines.md software-quality-guidelines.md apis-labels.md \
          legal-guidelines.md conclusion.md references.md annex.md"
CITATIONS_FILENAME=citations
OUTPUT_FILENAME=wp2-deliverable-2.2
OUTPUT_DIR=../output/$OUTPUT_FILENAME

# Function to run pandoc command
function run-pandoc () {
    pandoc -F pandoc-crossref --citeproc --standalone \
           --csl wp2.csl \
           --bibliography $CITATIONS_FILENAME.bib \
           -o $OUTPUT_DIR/$OUTPUT_FILENAME.$1 \
           config.yaml \
           $MD_FILES
}

# Create the output directory for docx and pdf files
mkdir -p $OUTPUT_DIR

# Copy markdown citations into a .bib file
cp $CITATIONS_FILENAME.md $CITATIONS_FILENAME.bib

# Get deliverable number from tags
NUMBER=`head -2 developer-guidelines.md | tail -1 | cut -f2 -d ":" | cut -f1 -d "," | sed "s/[^0-9\.]*//g"`

# Get deliverable version from tags
VERSION=`head -2 developer-guidelines.md | tail -1 | cut -f2 -d ":" | cut -f2 -d "," | sed "s/[^0-9\.]*//g"`

# Remove first 5 lines of HackMD metadata
for MD_FILE in $MD_FILES
do
    cp $MD_FILE /tmp/$MD_FILE
    tail -n +5 $MD_FILE > $MD_FILE-new
    mv $MD_FILE-new $MD_FILE
done

# Replace deliverable number from config.yaml
sed -i "s/<number>/$NUMBER/g" config.yaml

# Replace deliverable version from ToC.txt
sed -i "s/<version>/$VERSION/g" ToC.txt

# Add ToC after the executive summary
cat ToC.txt >> developer-guidelines.md

# Compute pdf file
run-pandoc pdf

# Get back original files from tmp
for MD_FILE in $MD_FILES
do
    mv /tmp/$MD_FILE .
done

# Delete .bib file
rm -rf $CITATIONS_FILENAME.bib

# Revert changes for ToC.txt and config.yaml
git checkout ToC.txt config.yaml
