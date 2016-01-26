library( ReporteRs );
library( ggplot2 )

doc = bsdoc( title = "pot objects", 
  description = "Reporters, pot objects", 
  keywords = "ReporteRs, text, format, bold, line, Word, docx, PowerPoint, pptx, html" )

mkd = "
A `pot` object (pieces of text or paragraph of text) is made 
of one or more chunk of text with different formatting properties. 

"
source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "pot objects", mkd )


default.par.properties = parProperties(text.align = "justify", padding = 0)


mkd = "
# Overview

ReporteRs provide a class of object to enable text formatting: `pot` objects. 

`pot` objects are created with function `pot`. These objects can be 
concatenated: an object can be added with another pot object or with a single 
text value (a character vector of length 1).

**A `pot` object is a set of text chunks, each chunk is 
associated with its own font properties.** A Footnote 
and an hyperlink can be associated to a `pot` object.

When `\\n` is used, a *soft return* is used.

These objects are to be used when adding paragraphs into a document or when working with FlexTable.

    pot('Hello World!')

Hello World!

    pot('Hello') + ' ' + pot( 'World!', textItalic() )

Hello *World!*

    my_text = pot( 'Cats',
      textProperties( color = '#1A2530' ) ) +
      ' and ' + pot('dogs', textBold( color = '#E74C3C' ) )
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )
    
my_text = pot( 'Cats',
  textProperties( color = '#1A2530' ) ) +
  ' and ' + pot('dogs', textBold( color = '#E74C3C' ) )
doc = addParagraph( doc, value = my_text, par.properties = default.par.properties )


mkd = "


# Usage

The function pot has two arguments:

* **value**: a text value or a value that has a format method returning character value.
* **format** (optional): formating properties (an  textProperties` object).

"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )
mkd = "The following code show usage of these parameters:

    my_text_prop = textProperties(color='#1163A5',
      font.size = 20, font.weight = 'bold', font.family = 'Courier New' )
    
    my_text = pot( value = 'My tailor', format = my_text_prop ) +
      ' is rich. ' +
      pot( value = 'Cats', format = chprop( my_text_prop, color = '#F0A91B') ) +
      ' and ' +
      pot( value = 'dogs', format = chprop( my_text_prop, color = '#D63C3A') )
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

my_text_prop = textProperties(color='#1163A5',
  font.size = 20, font.weight = 'bold', font.family = 'Courier New' )

my_text = pot( value = 'My tailor', format = my_text_prop ) +
  ' is rich. ' +
  pot( value = 'Cats', format = chprop( my_text_prop, color = '#F0A91B') ) +
  ' and ' +
  pot( value = 'dogs', format = chprop( my_text_prop, color = '#D63C3A') )

doc = addParagraph( doc, value = my_text, par.properties = default.par.properties )


mkd = "

## Examples

**add paragraphs in a list (with bullets)**

"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

doc = addParagraph( doc, pot( "The following script is producing the file ", format = textNormal() ) + 
    pot( "word_pot_demo.docx", 
      textNormal(color = "#428bca", underlined = TRUE ), 
      hyperlink = "./examples/word_pot_demo.docx" ), par.properties = default.par.properties
)
doc = addRScript( doc, file = "rexamples/word_pot_demo.R" )
source("rexamples/word_pot_demo.R")

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(), 
  src = "http://www.slideshare.net/slideshow/embed_code/37152293")




mkd = "

**add into FlexTable**

"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

doc = addParagraph( doc, pot( "The following script is producing the file ", format = textNormal() ) + 
    pot( "word_pot_cell_demo.docx", 
      textNormal(color = "#428bca", underlined = TRUE ), 
      hyperlink = "./examples/word_pot_cell_demo.docx" ), par.properties = default.par.properties
)
doc = addRScript( doc, file = "rexamples/word_pot_cell_demo.R" )
source("rexamples/word_pot_cell_demo.R")

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(), 
  src = "http://www.slideshare.net/slideshow/embed_code/37152561")


doc = addTitle( doc, value = "Hyperlink", level = 1, id = "pot_hyperlink")
mkd = "

Hyperlink can be added to pot objects.

Use argument `hyperlink` with function `pot`.

Here is an example:

    my_text = pot( 'Cats', hyperlink = 'http://en.wikipedia.org',
      textBoldItalic( color = '#428BCA', underline = TRUE ) ) 
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

    my_text = pot( 'Cats', hyperlink = 'http://en.wikipedia.org',
      textBoldItalic( color = '#428BCA', underline = TRUE ) ) 

doc = addParagraph( doc, my_text, par.properties = default.par.properties)


doc = addTitle( doc, value = "Footnotes", level = 1, id = "pot_footnotes")
mkd = "

Footnotes can be added to pot objects.

Use objects of class `Footnote` to create a Footnote. Function `pot` has an 
argument `footnote` to specify which Footnote to use. If missing, no footnote 
will be added.

**Footnote are not supported within PowerPoint documents.**

## Word example

"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

doc = addParagraph( doc, pot( "The following script is producing the file ", format = textNormal() ) + 
    pot( "footnote.docx", 
      textNormal(color = "#428bca", underlined = TRUE ), 
      hyperlink = "./examples/footnote.docx" ), par.properties = default.par.properties
)
doc = addRScript( doc, file = "rexamples/footnote_simple_example.R" )
source("rexamples/footnote_simple_example.R")

mkd = "

## HTML example

In a `bsdoc` file, it render as following (put your mouse over the asterisk symbol):

"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mydoc = addParagraph(doc, set_of_paragraphs( pot1, pot2 ) )



source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "pot_objects.html", ddmenu = "Formatting content")

writeDoc( doc, file = "pot_objects.html")
