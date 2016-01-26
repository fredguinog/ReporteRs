library( ReporteRs );
library( ggplot2 )
options("ReporteRs-fontsize" = 11 )

doc = bsdoc( title = "Editable vector graphics", 
  description = "Reporters, Editable vector graphics", 
  keywords = "ReporteRs, vector graphics, image, plot, Word, docx, PowerPoint, pptx, html" )

default.par.properties = parProperties(text.align = "justify", 
    padding.left = 0)

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Editable vector graphics", "Produce nice graphical outputs and let readers and reviewers modify the graphs." )

mkd = "
# Vector graphics

One advantage of ReporteRs is that the package let you produce R plot in 
a vector graphics format. It makes your charts prettier than with raster formats.


"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )


doc = addParagraph( doc, value = pot( "Word version should be > 2007 to be able to read these graphics.", 
  format = textBold(font.size = 16, color = "#f0ad4e") ), 
  par.properties = parLeft( padding = 3 ) )


mkd = "

This format is not readable by Word 2007. That's why the argument `vector.graphics` 
is set to **FALSE** with docx objects. 

Set argument ``vector.graphics`` to *TRUE* with function **addPlot** to produce vector.graphics 
within Word documents.
    
    doc = docx()
    doc = addPlot( doc, fun = function() plot(sin, -pi, 2*pi), vector.graphics = TRUE )

# Editable graphics

Another big advantage of ReporteRs is that these vector graphics images 
are editable. When the document is edited in Word or PowerPoint application, 
graphical components like points, lines, text can be modified or even added.

"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

doc = ReporteRs::addImage( doc, filename = "figure/DML_WORD_UPDATED.png", width = 9.41, height = 6.94 )



mkd = "

This make possible to let reviewers annotate themself graphics you produced.

Argument `editable` of function `addPlot` can be set to **FALSE** to desable 
edition of the graph components.

# Example

Below an example with a PowerPoint document. 

The script is producing the following file: [EVG_example.pptx](examples/EVG_example.pptx).

Open the document, zoom in and out on the 2 graphics to see quality differences, 
then click a text area on the right graphic and modify it.
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )
doc = addRScript( doc, file = "rexamples/EVG_example.R" )
source("rexamples/EVG_example.R")


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "evg.html", ddmenu = "Formatting content")

writeDoc( doc, file = "evg.html")
