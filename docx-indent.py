#!/usr/bin/env python3

"""docx-indent
This script indents docx paragraphs according to a determined alignment style

Usage:

./docx-indent.py DOCX_PATH
"""

import sys

from docx import Document
from docx.enum.text import WD_ALIGN_PARAGRAPH


def main() -> None:
    # Open the docx document
    document = Document(sys.argv[1])
    # Retrieve all paragraphs present in the document
    paragraphs = document.paragraphs
    # Iterate over each paragraph
    for paragraph in paragraphs:
        # Get the format of a paragraph
        paragraph_format = paragraph.paragraph_format
        # Justify the paragraph
        paragraph.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
    # Save the new formatted document
    document.save(sys.argv[1])


if __name__ == "__main__":
    main()
