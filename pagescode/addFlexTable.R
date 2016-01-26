library( ReporteRs );
library( ggplot2 )

doc = bsdoc( title = "Reporters - addFlexTable",
  description = "Reporters, add table",
  keywords = "ReporteRs, table, FlexTable, Word, docx, PowerPoint, pptx, html" )

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Function addFlexTable", "add `FlexTable` to document objects." )

default.par.properties = parProperties(text.align = "justify", padding.top = 3)

doc = addTitle( doc, value = "Word and html document", level = 1 )

mkd = "
Add a [FlexTable](./FlexTable.html 'FlexTable') object in a document object
with the function addFlexTable. Expected arguments are:
"

doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )

mkd <- "

* the document object
* the [FlexTable](./FlexTable.html 'FlexTable') object
* eventually a `parProperties` object to define alignement. Note that with docx objects, only alignment will be used,
if you'd like to add space around a table, specify padding on preceding and or following paragraph.
"

doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )

mkd <- "

    doc = addFlexTable( doc, vanilla.table(head(iris)), par.properties = parCenter() )

"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

doc = addFlexTable( doc, vanilla.table(head(iris)), par.properties = parCenter() )

mkd <- "
# PowerPoint document

A `pptx` object works the same but does not require any `parProperties` as
the FlexTable will be positioned into a shape.

You can use the next available shape in the current slide if not specifying any other parameters.
You can also position the FlexTable anywhere inside the current slide if specifying dimensions
and positions.

"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "addFlexTable.html", ddmenu = "Main functions")

writeDoc( doc, file = "addFlexTable.html")
