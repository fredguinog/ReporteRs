library( ReporteRs );
library( ggplot2 )

default.par.properties = parProperties(text.align = "justify", padding.left = 0)

doc = bsdoc( title = "Reporters - Getting started",
  description = "Reporters",
  keywords = "ReporteRs, Word, docx, PowerPoint, pptx, html" )

mkd = "
`ReporteRs` is an R package for
creating Microsoft (Word docx and Powerpoint pptx) and html documents.

It does not require any Microsoft component to be used.

It runs on Windows, Linux, Unix and Mac OS systems.

This is the ideal tool to automate reporting generation from R.
"
source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Getting started", mkd )


mkd = "
# Installation

## Dependencies

ReporteRs needs `rJava` with a java version >= 1.6 ; make sure you have an installed JRE.

    system(\"java -version\")
    # should return \"java version '1.6.0'\" or greater.

Test your `rJava` installation with the following code, you should get your java version in a string:

    require(rJava)
    .jcall('java.lang.System','S','getProperty','java.version')

## Get CRAN version

    install.packages('ReporteRs')

## Build the latest version from Github

    require('devtools')
    install_github('ReporteRsjars', 'davidgohel')
    install_github('ReporteRs', 'davidgohel')

## Get binaries from Github

Binary versions are available on
Github (for Windows and Mac OS)
[here](http://github.com/davidgohel/ReporteRs/releases/).

"
doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )






mkd <- "# Introduction

You can use the package as a tool for fast reporting and as a tool for reporting automation.

There are several features to let you format and present R outputs, for example:

* **Editable Vector Graphics**: let your readers modify and annotate plots.
* **Tables**: `FlexTable` objects let you format any complex table.
* **Text output**: format texts and paragraphs. Use markdown format.
* Reuse of corporate **template document** (*.docx and *.pptx).

## Produce a document in few lines of codes

There are default templates and default values, it enables easy generation
of R outputs in few lines of codes.

Below a short R script:

    require( ggplot2 )
    doc = docx( title = 'My document' )

    doc = addTitle( doc , 'First 5 lines of iris', level = 1)
    doc = addTable( doc , iris[1:5, ], layout.properties= get.light.tableProperties())

    doc = addTitle( doc , 'ggplot2 example', level = 1)
    myggplot = qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width )
    doc = addPlot( doc = doc , fun = print, x = myggplot )

    doc = addTitle( doc , 'Text example', level = 1)
    doc = addParagraph( doc, 'My tailor is rich.', stylename = 'Normal' )

    writeDoc( doc, 'my_first_doc.docx' )
"
doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )






mkd <- "
## Reporting automation

It lets you also create corporate documents, creation of complex tables,
pretty graphical rendering with a set of R functions.

To automate document generation only R code is necessary.

With Word and PowerPoint document, you can add contents from R but also replace
contents. By default, content is added at the end of the specified template document.
When generating Word document, bookmarks can be used to define locations of
replacements in the document. When generating PowerPoint document, slide indexes
can be used to define locations of slides to replace in the presentation.

It is not possible to replace content in HTML document.

"
doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )






mkd <- "
# Main functions list

**All theses functions are documented in the package.**

The following functions can be used whatever the output format is (docx, pptx, html):

* [addTitle](./addTitle.html): Add a title
* [addFlexTable](./addFlexTable.html): Add a FlexTable
* [addPlot](./addPlot.html): Add plots
* [addImage](./addImage.html): Add external images
* [addMarkdown](./markdown.html): Add markdown
* [addRScript](./addRScript.html): Add syntax highlighted R code
* [addParagraph](./addParagraph.html): Add paragraphs of text
* [writeDoc](./writeDoc.html): Write the document into a file
"
doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )






mkd <- "

The following functions can only be used when the output format is `docx`.

* [styles](./word.html): Get available styles
* [addTOC](./focus_toc.html): Add a table of contents
* [addPageBreak](./word.html): Add a page break
* **addSection** : Add a new section (landscape or portrait orientation and split content within columns)
* **dim** : Get page dimensions

"
doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )






mkd <- "
The following functions can only be used when the output format is `pptx`.

* **slide.layouts**: Get available layout names
* **addSlide**: Add a slide
* [addDate](./powerpoint.html): Add a date
* [addPageNumber](./powerpoint.html): Add a page number
* [addFooter](./powerpoint.html): Add a comment in the footer
* [addSubtitle](./powerpoint.html): Add a sub title
* **dim** : Get shape dimensions

"
doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )

mkd <- "
The following functions can only be used when the output format is `bsdoc`.

* [addBootstrapMenu] (./bsdoc.html): add a menu to the web page (like the one being used in these web pages).
* **addIframe**: add an iframe
* [addFooter] (./bsdoc.html): add a footer to the web page (like the one being used in these web pages).
"
doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )

mkd <- "

Also `as.html` can be used to produce html code corresponding to `pot`, `plot` and `FlexTable` objects.

"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "gettingstarted.html")

writeDoc( doc, file = "gettingstarted.html")
