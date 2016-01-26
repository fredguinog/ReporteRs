library( ReporteRs );
library( ggplot2 )

doc = bsdoc( title = "Reporters - addParagraph", 
  description = "Reporters, add text", 
  keywords = "ReporteRs, text, paragraph, Word, docx, PowerPoint, pptx, html" )

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Function addParagraph", "add text to document objects." )


default.par.properties = parProperties(text.align = "justify", 
  	padding.left = 0)

mkd = "
# Features

* Insert paragraph of text into the output document.
* Apply formating properties to chunk of text.
* Insert ordered or unordered list of paragraphs

# Paragraph definition

A paragraph begins on a new line. It is made of either:
* a group of formatted chunks of words (a [pot](./pot_objects.html) object)
* or a character vector (of length 1). 

    doc = addParagraph( doc, value = \"Hello World\" )
    doc = addParagraph( doc, value = \"A new paragraph is on a new line.\" )

It is associated with a [parProperties](formatting_properties.html#parProperties) 
object. It is used to control formatting of the paragraphs. 

    doc = addParagraph( doc, value = \"Hello World\", par.properties = parCenter() )

# Usage

The function requires one of the following types of argument:

* a [pot](pot_objects.html) object. 
* a set&#95;of&#95;paragraphs object (a list container for pot objects)
* a character vector

        text1 = pot('My tailor', textProperties(color='#354B5E' ) ) + ' is ' + 
          pot('rich', textProperties(font.weight='bold', color = '#D74B4B') )
        doc = addParagraph( doc, text1 )
        
        text2 = pot('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus.', 
          textProperties(color='#D74B4B') ) + 
            ' Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.'
        doc = addParagraph( doc, set_of_paragraphs(text2, 'Cras elementum ultrices diam.') )


*See below for results:*
"
doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

text1 = pot('My tailor', textProperties(color='#354B5E' ) ) + ' is ' + pot('rich', textProperties(font.weight='bold', color = '#D74B4B') )
doc = addParagraph( doc, text1, par.properties = default.par.properties )

text2 = pot('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus.', textProperties(color='#D74B4B') ) + ' Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.'
doc = addParagraph( doc, set_of_paragraphs(text2, 'Cras elementum ultrices diam.'), par.properties = default.par.properties )


mkd = "
## With Word documents

If `addParagraph` is used with a `docx` object, paragraph properties will 
be those defined in the style defined by argument `stylename` or those of the `par.properties` 
argument (and argument stylename will be ignored).

## With PowerPoint and HTML documents

If beeing used with a `pptx` or an `bsdoc` object, paragraph properties will be those 
of `par.properties` argument.

# Ordered and unordered list items

If paragraph has to be in a ordered or unordered list, use argument `par.properties` 
to specify the type of list and the level of nesting:

    doc = addParagraph( doc, value = 'A list item',
      par.properties = parProperties(list.style = 'unordered', level = 1) )
    doc = addParagraph( doc, value = 'A list item with level 2',
      par.properties = parProperties(list.style = 'unordered', level = 2) )


"
doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

doc = addParagraph( doc, value = 'A list item',
  par.properties = parProperties(list.style = 'unordered', level = 1) )
doc = addParagraph( doc, value = 'A list item with level 2',
  par.properties = parProperties(list.style = 'unordered', level = 2) )


mkd = "
# Append paragraphs into a pptx shape

When working with a `pptx` object, it is possible to add paragraphs in the 
current shape instead of sending them into a new shape. 

Define argument `append` to TRUE and paragraphs will be appened in the current shape.

**Paragraphs can only be appended on shape containing paragraphs (i.e. you can not 
add paragraphs after a FlexTable).**

    doc = addParagraph( doc, value = 'A list item',
      par.properties = parProperties(list.style = 'unordered', level = 1) )
    doc = addParagraph( doc, value = 'A list item with level 2', append = T,
      par.properties = parProperties(list.style = 'unordered', level = 2) )


"
doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)

doc = addBSMenu( doc, itemlink = "addParagraph.html", ddmenu = "Main functions")

writeDoc( doc, file = "addParagraph.html")
