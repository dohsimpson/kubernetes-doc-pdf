#!/bin/bash

set -x

PDF_DIR=PDFs

sed -i -e "s/’/\'/g" -e "s/–/-/g" -e "s/“/\"/g" -e "s/”/\"/g" $1.html

docker run -it --name weasy -d 4teamwork/weasyprint:56.1
docker cp codeblock_wrap.css weasy:/tmp/codeblock_wrap.css
# fix weasyprint bug
docker exec -u0 weasy sed -i "s/float(node.get('stroke-opacity', 1))/node.get('stroke-opacity', 1); stroke_opacity = 1.0 if type(stroke_opacity) == str else float(stroke_opacity)/" /usr/lib/python3.10/site-packages/weasyprint/svg/__init__.py
docker exec -u0 weasy sed -i "s/float(node.get('fill-opacity', 1))/node.get('fill-opacity', 1); fill_opacity = 1.0 if type(fill_opacity) == str else float(fill_opacity)/" /usr/lib/python3.10/site-packages/weasyprint/svg/__init__.py
docker exec -i weasy weasyprint -v -s /tmp/codeblock_wrap.css '-' '-' >| "$PDF_DIR/$1.pdf" < $1.html
docker stop weasy
docker rm -f weasy
