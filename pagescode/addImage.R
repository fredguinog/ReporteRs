library( ReporteRs );
library( ggplot2 )

doc = bsdoc( title = "Reporters - addImage", 
  description = "Reporters, add image", 
  keywords = "ReporteRs, plot, image, Word, docx, PowerPoint, pptx, html" )

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Function addImage", "add external images to document objects." )

default.par.properties = parProperties(text.align = "justify", 
    padding.left = 0)

mkd = "
# External images

Insert external images into the output document. Supported format:

* `docx` and `pptx` objects can receive PNG, WMF, JPEG and GIF images. 
* `bsdoc` objects can receive PNG, JPEG and GIF images. 

# positioning

Paragraph properties (ie. alignment, padding) will be those of `par.properties` argument.

# Example

    # the file 'logo.jpg' only exists in R for Windows - to test that code, change the 
    # variable img.file to make it point on a valid img file
    img.file = file.path( Sys.getenv(\"R_HOME\"), \"doc\", \"html\", \"logo.jpg\" )
    doc <- addImage(doc, img.file, width = 1.4, height = 1, par.properties = parLeft() )    
"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

img.file = file.path( Sys.getenv("R_HOME"), "doc", "html", "logo.jpg" )

doc <- ReporteRs::addImage(doc, img.file, width = 1.4, height = 1, par.properties = parLeft())
doc = addMarkdown( doc, text = "    doc <- addImage(doc, img.file, width = 1.4, height = 1 , par.properties = parCenter() )", 
  default.par.properties = default.par.properties )
doc <- ReporteRs::addImage(doc, img.file, width = 1.4, height = 1 , par.properties = parCenter() )



source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "addImage.html", ddmenu = "Main functions")

writeDoc( doc, file = "addImage.html")
