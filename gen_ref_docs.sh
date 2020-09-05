#!/bin/bash

set -e
set -u
set -x

PDF_DIR=PDFs

weasyprint -s codeblock_wrap.css "https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands" "$PDF_DIR/kubectl-commands.pdf"

# DOC_VERSION="$1" # e.g. 1.18

# weasyprint -s codeblock_wrap.css "https://kubernetes.io/docs/reference/generated/kubernetes-api/v${VERSION}/#cronjobspec-v1beta1-batch" "$PDF_DIR/kubectl-commands.pdf"
