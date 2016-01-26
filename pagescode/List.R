library( ReporteRs );
library( ggplot2 )
options("ReporteRs-fontsize" = 11 )

    numbering.pattern = c( '%1.', '%1. %2.', '%1. %2. %3.', 
      '%4.', '%5.', '%6.', '%7.', '%8.', '%9.' )
    ordered.formats = rep( 'decimal', 9 )
    unordered.formats = rep( c( 'disc', 'square', 'circle'), 3 )
    left.indent = seq( from = 0, by = 0.5, length.out = 9)
    my_list_desc = list( 
      ol.left = left.indent, ol.hanging = rep( 0.4, 9 ), ol.format = ordered.formats, 
      ol.pattern = numbering.pattern, 
      ul.left = left.indent, ul.hanging = rep( 0.4, 9 ), ul.format = unordered.formats
      )

    options('ReporteRs-list-definition' = my_list_desc )

doc = bsdoc( title = "Reporters - lists", 
  description = "Reporters, Lists", 
  keywords = "ReporteRs, list, bullet, ordered, unordered, Word, docx, PowerPoint, pptx, html" )

default.par.properties = parProperties(text.align = "justify", padding = 0)

mkd = "`ReporteRs` lets you create ordered or unordered lists."
source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Create lists from R", mkd )



mkd = "
# Usage

Use `parProperties` objects to create bulleted or numbered lists.

To specify list formatting, use arguments `list.style` and `level`:

* **list.style**: set argument to 'unordered' or 'ordered'.
* **level**: specify the level of the paragraph in the list (2 mean item will be 
at level 2 of the nested list).

        mydoc = addParagraph( mydoc, value = 'hello world',
            par.properties = parProperties(list.style = 'ordered', level = 1 ) )

To restart a numbering set argument `restart.numbering` (of function `addParagraph`) to TRUE.

        mydoc = addParagraph( mydoc, value = 'hello world', restart.numbering = TRUE, 
            par.properties = parProperties(list.style = 'ordered', level = 1 ) )

# Format ordered and unordered lists

Create a description used to format ordered and unordered lists in object documents.

    numbering.pattern = c( '%1.', '%1. %2.', '%1. %2. %3.', 
      '%4.', '%5.', '%6.', '%7.', '%8.', '%9.' )
    ordered.formats = rep( c( 'decimal', 'upperRoman', 'upperLetter'), 3 )
    unordered.formats = rep( c( 'disc', 'square', 'circle'), 3 )
    left.indent = seq( from = 0, by = 0.5, length.out = 9)
    my_list_desc = list( 
      ol.left = left.indent, ol.hanging = rep( 0.4, 9 ), ol.format = ordered.formats, 
      ol.pattern = numbering.pattern, 
      ul.left = left.indent, ul.hanging = rep( 0.4, 9 ), ul.format = unordered.formats
      )

This description is set as an argument of document objects (`list.definition`):

    doc = docx( list.definition = my_list_desc )

or can be set with function `options`:

    options('ReporteRs-list-definition' = my_list_desc )

And below the output:

1. Item 1
    1. Item 1.1
        1. Item 1.1.1

* Item a
    * Item b
        * Item c


----

"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd = "
# Example 
"
doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

doc = addParagraph( doc, pot( "The following script is producing the file ", format = textNormal() ) + 
    pot( "lists.docx", 
      textNormal(color = "#428bca", underlined = TRUE ), 
      hyperlink = "./examples/lists.docx" ), par.properties = default.par.properties
)
doc = addRScript( doc, file = "rexamples/list_example.R" )
source("rexamples/list_example.R")

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(), 
  src = "http://www.slideshare.net/slideshow/embed_code/40448913")



source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "lists.html", ddmenu = "Formatting content")

writeDoc( doc, file = "lists.html")
