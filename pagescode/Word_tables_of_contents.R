library( ReporteRs );
library( ggplot2 )

options("ReporteRs-fontsize" = 11 )


doc = bsdoc( title = "Reporters - Word",
  description = "Reporters, Word template",
  keywords = "ReporteRs, Word, template, docx" )

mkd = "
Insert standard or customized tables of content in Word.
"

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Tables of contents with Word", mkd )



default.par.properties = parProperties(text.align = "justify",
    padding.left = 0)

mkd = "
# Table of contents

Insert a table of contents with function **addTOC**.
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "

    doc = addTOC( doc )
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "

> When added, a TOC will make Word to pop-up a message-box asking you
if you want to update TOC entries. **This is not an error**, you should
click 'Yes' to update TOC entries.

# Customized table of contents

Add a customized table of contents with the argument `stylename`.
If used, a table of contents will be created containing entries
formatted with specified styles.

    # add a table of all paragraphs with style 'stylename'
    doc = addTOC( doc, stylename = 'stylename' )


# Example: Add a list of figures and a list of tables

In the following example, style `figurereference` is used as style of paragraphs
following graphics, as a **caption** for plots. Style `tablereference` is used as style
of paragraphs following table, as a **caption** for tables.

These styles are available in the template file *templates/template_toc.docx*.

We will:
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "

1. add a table of content
2. add a table of figures
3. add a table of tables
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "

We will use the following file as template: [template.docx](templates/template.docx)

The script is producing the following file: [toc_demo.docx](examples/toc_demo.docx)

"
source(file = "rexamples/toc_demo.R")

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(),
  src = "http://www.slideshare.net/slideshow/embed_code/37012502")

doc = addRScript( doc, file = "rexamples/toc_demo.R" )


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "focus_toc.html", ddmenu = "Word")

writeDoc( doc, file = "focus_toc.html")
