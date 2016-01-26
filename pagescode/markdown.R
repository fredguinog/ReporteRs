library( ReporteRs );
library( ggplot2 )
options("ReporteRs-fontsize" = 11 )

doc = bsdoc( title = "Reporters - markdown", 
  description = "Reporters, markdown", 
  keywords = "ReporteRs, markdown, Word, docx, PowerPoint, pptx, html" )

default.par.properties = parProperties(text.align = "justify", padding = 0)


mkd = "Minimal implementation of the Markdown format"
source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Markdown", mkd )

mkd = "
# Introduction

ReporteRs usage a too verbose when it has to handle lot of textual output. Also, 
addParagraph is less human *readable* than Markdown. 

To make easier to let report text, markdown has been implemented in ReporteRs.

# Details

The markdown definition used is John Gruber's one, documented here: 
[DaringFireball](http://daringfireball.net/projects/markdown/syntax).

Pandoc footnotes have been added. See pandoc 
[README] (http://johnmacfarlane.net/pandoc/README.html#footnotes).

The function is to be improved, few things are still to be implemented: 

* underscores do not emphasis text (asterisks only are supported).
* code blocks are expected to be valid R code
* inline images are not available

The function does not implement HTML parsing but this is 
not in the *todo list*. 

# Example
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

doc = addParagraph( doc, pot( "The following script is producing the file ", format = textNormal() ) + 
    pot( "markdown.docx", 
      textNormal(color = "#428bca", underlined = TRUE ), 
      hyperlink = "./examples/markdown.docx" ), par.properties = default.par.properties
)
doc = addRScript( doc, file = "rexamples/addMarkdown_example.R" )
source("rexamples/addMarkdown_example.R")


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "markdown.html", ddmenu = "Formatting content")

writeDoc( doc, file = "markdown.html")
