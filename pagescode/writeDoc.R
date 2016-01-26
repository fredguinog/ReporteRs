library( ReporteRs );
library( ggplot2 )

doc = bsdoc( title = "writeDoc", 
  description = "Reporters, write document", 
  keywords = "ReporteRs, write, file, Word, docx, PowerPoint, pptx, html" )


source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Function writeDoc", "Write document object in a file" )


default.par.properties = parProperties(text.align = "justify", 
    padding.left = 0)

mkd = "
# Word document

    doc = docx()
    # add content in doc here...
    writeDoc( doc, file = \"example.docx\" )

Argument file has to end with `.docx`.

# PowerPoint document

    doc = pptx()
    # add content in doc here...
    writeDoc( doc, file = \"example.pptx\" )

Argument file has to end with `.pptx`.

# HTML document

    doc = bsdoc()
    # add content in doc here...
    writeDoc( doc, file = \"example.html\" )

Argument file has to end with `.html`.

"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "writeDoc.html", ddmenu = "Main functions")

writeDoc( doc, file = "writeDoc.html")
