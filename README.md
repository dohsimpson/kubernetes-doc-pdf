# Kubernetes PDF Documentation

### This repository contains all the [Kubernetes documentation](https://kubernetes.io/docs/home/) in PDF format, generated automatically.

## How the files are structured?
PDF files can be found under PDFs directory; they are grouped in sections:

* Setup (Getting Started)
* Concepts
* Tasks
* Tutorials
* Reference
* `kubectl` Reference

For a more detailed index, see [here](https://kubernetes.io/docs/home/#browsedocs)

## Dependencies
* `docker`
* `python3`
    * `pipenv`
    * `requests-html`

# How to run the code
1. Install the dependencies. Use `$ pipenv install` for installing python packages.
2. `$ pipenv shell`
3. `$ python kubernetes-doc.py`
4. `$ ./gen_ref_docs.sh`

# Similar Project:

* EPUB/MOBI version of the documents can be found [here](https://github.com/tha2015/kubernetes-doc-epub)

* [Terraform PDF Documentation](https://github.com/dohsimpson/terraform-doc-pdf)
