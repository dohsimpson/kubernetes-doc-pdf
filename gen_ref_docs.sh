#!/bin/bash

set -e
set -u
set -x

rm -f kubectl-commands.html
wget "https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands.html"
./weasy_print.sh kubectl-commands
