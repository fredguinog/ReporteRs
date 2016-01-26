library( ReporteRs );
library( ggplot2 )

doc = bsdoc( title = "Reporters - addTitle", 
  description = "Reporters, add title", 
  keywords = "ReporteRs, title, Word, docx, PowerPoint, pptx, html" )

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Function addTitle", "add titles to document objects." )

default.par.properties = parProperties(text.align = "justify", 
    padding.left = 0)

mkd = "
# Word document

To add a title into a `docx` object, you have to specify the text to use 
as title and the level of the title.

The argument `level` of function `addTitle` is the level of the title/heading. 
If *level = 1*, it will create a title with top-level heading. If *level = 2*, 
it will create a title with second-level heading, and so on.

Note that to be considered as entries for a Table of contents, 
titles have to be added with function `addTitle`.

    doc = docx()
    doc = addTitle( doc = doc, value = \"title 1\", level = 1 )

## Titles and associated styles

Function `addTitle` needs to know which style correspond to which 
title level (1 ; 1.1 ; 1.1.1 ; etc.).

When a template is read, ReporteRs tries to guess what are the available styles (english, french, chinese, etc.). 
If styles for titles has not been detected you will see the following error when `addTitle` is being called:

``You must defined title styles via declareTitlesStyles first.``

As the error message points out, you have to call the function `declareTitlesStyles` to 
indicate which available styles are meant to be used as title styles.

*The following example assume that available styles are Titre1, Titre2, etc. If your system 
is english, you should see Title1, Title2, etc when using `styles(...)`.*
"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

doc = addParagraph( doc, pot( "The following script is producing file ", format = textNormal() ) + 
    pot( "declare_titles_styles.docx", 
      textNormal(color = "#428bca", underlined = TRUE ), 
      hyperlink = "./examples/declare_titles_styles.docx" ), par.properties = default.par.properties
)

doc = addRScript( doc, file = "rexamples/word_declare_titles_styles.R" )

mkd = "
# HTML document

To add a title into a `bsdoc` object, you have to specify the text to use 
as title and the level of the title.

The argument `level` of function `addTitle` is the level of the title/heading. 
If *level = 1*, it will create a title with top-level heading. If *level = 2*, 
it will create a title with second-level heading, and so on.

    doc = bsdoc()
    doc = addTitle( doc = doc, value = \"title 1\", level = 1 )
"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

mkd = "
# PowerPoint document

To add a title into a `pptx` object, object (in the current slide) , you 
only have to specify the text to use as title. There is no level concept.

In a PowerPoint document, a title is a specific shape that is (most 
of the time) present in a slide or slide layout.

    doc = pptx( title = \"title\" )
    doc = addSlide( doc, slide.layout = \"Title and Content\" )
    # Here we fill the title shape with \"My title\"
    doc = addTitle( doc, \"My title\" )
"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "addTitle.html", ddmenu = "Main functions")

writeDoc( doc, file = "addTitle.html")
