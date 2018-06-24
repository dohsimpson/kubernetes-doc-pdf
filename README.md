# Kubernetes PDF Documentation

### This repository contains all the [Kubernetes documentation](https://kubernetes.io/docs/home/) in PDF format, generated automatically.

## How the files are structured?
PDF files are grouped in sections:

* Setup
* Concepts
* Getting Started Guide (Independent Solutions)
* Tasks
* Tutorials
* Reference
* Imported Docs

For a more detailed index, see [here](https://kubernetes.io/docs/home/#browsedocs)

## Dependencies
* `librsvg`: For Mac: `brew install librsvg`. [ref](https://pypi.org/project/foliantcontrib.pandoc/)
* `xelatex`: I installed it on my Macbook by: 1. Install [pkg](http://www.texts.io/support/0001/) 2. Download [ucharcat.sty](http://www.tug.org/texlive//devsrc/Master/texmf-dist/tex/latex/ucharcat/ucharcat.sty) 3. Place it under a certain [directory](https://tex.stackexchange.com/questions/121257/how-do-i-install-a-style-file-on-mac-10-8-other-answers-dont-seem-to-work#comment270807_121257)
* `pandoc`: For mac, `brew install pandoc`
* `python3`
    * `pipenv`
    * `pypandoc`
    * `requests-html`

# How to run the code
1. Install the dependencies. Use `$ pipenv install` for installing python packages.
2. `$ pipenv shell`
3. `$ python kubernetes-doc.py`

# Similar Project:

See [Terraform PDF Documentation](https://github.com/dohsimpson/terraform-doc-pdf)
