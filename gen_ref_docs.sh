#!/bin/bash

set -e
set -u
set -x

PDF_DIR=PDFs

weasyprint -s codeblock_wrap.css "https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands" "$PDF_DIR/kubectl-commands.pdf"
