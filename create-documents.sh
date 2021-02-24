#!/bin/bash

pushd wp2-deliverable-2.1
./deliverable.sh
popd

pushd draft
./draft.sh
popd

DOCX_FILES=`find . -type f -name "*.docx"`
for DOCX_FILE in $DOCX_FILES
do
    ./docx-indent.py $DOCX_FILE
done
