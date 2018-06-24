import requests_html as rh
import pypandoc

def generate_directory_pdf(url, name, s=None):
    s = rh.HTMLSession() if not s else s
    r1 = s.get(url)

    html = ""
    anchors = r1.html.find('.item')
    links = [a.absolute_links.pop() for a in anchors]
    # links = filter(lambda href: href.find('/scratch/') == -1, links) # filter out links

    print("downloading...")
    for l1 in links:
        r2 = s.get(l1)
        # r2.html.render()
        div = r2.html.find('#docsContent', first=True)
        if div:
            try:
                if name in ["Setup", "Tutorials", "Reference"]:  # will give duplicate id error, go through pages one by one to skip error page
                    print("testing " + l1, end='')
                    output = pypandoc.convert_text(div.html, "pdf", format="html", outputfile="/tmp/kubernetes_pdf_doc_tmp.pdf".format(name), extra_args=['--pdf-engine=xelatex'])
                    print(" works")
            except Exception as e:
                print(" failed!")
                print(e)
            else:
                html += div.html
        with open("/tmp/{}.html".format(name), "wt") as f:
            f.write(html)

    print("generating pdf...")
    try:
        output = pypandoc.convert_text(html, "pdf", format="html", outputfile="./{}.pdf".format(name), extra_args=['--pdf-engine=xelatex', '--css=codeblock_wrap.css'])
    except Exception as e:
        print(e)

if __name__ == '__main__':
    s = rh.HTMLSession()
    directories = [\
                   "Setup",
                   "Concepts",
                   "Getting-started-guides",
                   "Tasks",
                   "Tutorials",
                   "Reference",
                   # "Admin",  # this direct to concepts
                   "Imported",
                   ]
    directories_pairs = [("https://kubernetes.io/docs/{}/".format(n.lower()), n) for n in directories]
    for url, name in directories_pairs:
        print(name)
        generate_directory_pdf(url, name)
