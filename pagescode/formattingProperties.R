library( ReporteRs );
library( ggplot2 )
library( XLConnect )

wb <- loadWorkbook( "data/formatting_properties_arguments.xlsx" )
arguments <- readWorksheet(wb, sheet = "arguments")


doc = bsdoc( title = "Reporters - Formatting properties",
  description = "Reporters",
  keywords = "ReporteRs, format, center, align, font, Word, docx, PowerPoint, pptx, html" )

mkd = "
`ReporteRs` has functions to manage objects representing text formatting properties,
paragraph formatting properties, border formatting properties and
cell formatting properties.

Use these function to control format of text and tables.
"
source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Formatting properties", mkd )
#
default.par.properties = parProperties(text.align = "justify", padding.left = 0)

mkd <- "
# Default values

With ReporteRs, some options can be used to reduce usage of some parameters.
These are then used as default values for `textProperties` objects.

* **'ReporteRs-default-font'**: Default font family to use (default to \"Helvetica\"). This will
be used as default values for argument `fontname` of addPlot and argument `font.family` of pot.
* **'ReporteRs-fontsize'**: Default font size to use (default to 11). This will be
used as default values for argument `pointsize` of addPlot and argument `font.size` of pot.

"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

mkd <- "    options('ReporteRs-fontsize'=10, 'ReporteRs-default-font'='Arial')"

doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )

doc = addTitle( doc, value = "Available formatting properties", level = 1)
doc = addTitle( doc, value = "Text formatting properties", level = 2, id = "textProperties" )

mkd = "
Create a `textProperties` object that describes text formatting properties. It
let you specify font name color, size, weight, etc.

`textProperties` objects can be used with function `pot` and when manipulating `FlexTable` objects.

See below the list of supported properties:

"

MyFTable = FlexTable( data = arguments[ arguments$Function=="textProperties", -1]
  , header.text.props=textBold( color = "#1A2530" )
)
MyFTable = setZebraStyle( MyFTable, odd = "#eeeeee", even = "#dddddd" )
MyFTable = setFlexTableBorders( MyFTable
  , inner.vertical = borderProperties( style = "none" )
  , inner.horizontal = borderProperties( color = "#1A2530" )
  , outer.vertical = borderProperties( width = 2, color = "#1A2530" )
  , outer.horizontal = borderProperties( width = 2, color = "#1A2530" )
)
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

doc = addFlexTable( doc, MyFTable )

mkd = "
**Usage**

    my_text = pot('My tailor', textProperties(color='#1163A5', font.size = 24) ) +
      pot(' is ', textProperties(font.style = 'italic', color='gray', font.size = 22) ) +
      pot('rich', textProperties(font.weight='bold', color='#D63C3A', font.size = 20) )

"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

my_text = pot('My tailor', textProperties(color='#1163A5', font.size = 24) ) +
  pot(' is ', textProperties(font.style = 'italic', color='gray', font.size = 22) ) +
  pot('rich', textProperties(font.weight='bold', color='#D63C3A', font.size = 20) )

doc = addParagraph( doc, value = my_text, default.par.properties = default.par.properties )


doc = addTitle( doc, value = "Paragraph formatting properties", level = 2, id = "parProperties" )

mkd = "
Create a `parProperties` object that describes paragraph formatting properties.
It let you specify text alignment, paddings, the kind of numbering if paragraphs are a list, etc.

A `parProperties` object is used by several functions, ie. addPlot, addFlexTable, addParagraph.

See below the list of supported properties:

"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

MyFTable = FlexTable( data = arguments[ arguments$Function=="parProperties", -1]
  , header.text.props=textBold( color = "#1A2530" )
)
MyFTable = setZebraStyle( MyFTable, odd = "#eeeeee", even = "#dddddd" )
MyFTable = setFlexTableBorders( MyFTable
  , inner.vertical = borderProperties( style = "none" )
  , inner.horizontal = borderProperties( color = "#1A2530" )
  , outer.vertical = borderProperties( width = 2, color = "#1A2530" )
  , outer.horizontal = borderProperties( width = 2, color = "#1A2530" )
)

doc = addFlexTable( doc, flextable = MyFTable )

mkd = "
**Usage**

    MyFTable = FlexTable( data = iris[1:5, ] )
    MyFTable[ 1:2, 4:5] = parProperties( text.align = 'right', padding = 6 )
    doc = addFlexTable( doc, flextable = MyFTable, par.properties( text.align = 'center' ) )

"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable( data = iris[1:5, ] )
    MyFTable[ 1:2, 4:5] = parProperties( text.align = 'right', padding = 6 )
    doc = addFlexTable( doc, flextable = MyFTable, parProperties( text.align = 'center' ) )

doc = addTitle( doc, value = "Cell formatting properties", level = 2, id = "cellProperties" )

mkd = "
Create a `cellProperties` object that describes cell formatting properties.
It let you specify cell borders, background color, etc.

A cellProperties object is used with `FlexTable` objects.

See below the list of supported properties:
"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )
MyFTable = FlexTable( data = arguments[ arguments$Function=="cellProperties", -1]
  , header.text.props=textBold( color = "#1A2530" )
)
MyFTable = setZebraStyle( MyFTable, odd = "#eeeeee", even = "#dddddd" )
MyFTable = setFlexTableBorders( MyFTable
  , inner.vertical = borderProperties( style = "none" )
  , inner.horizontal = borderProperties( color = "#1A2530" )
  , outer.vertical = borderProperties( width = 2, color = "#1A2530" )
  , outer.horizontal = borderProperties( width = 2, color = "#1A2530" )
)

doc = addFlexTable( doc, flextable = MyFTable )

mkd = "
**Usage**

    MyFTable = FlexTable( data = iris[1:5, ] )
    MyFTable[ 1:2, 4:5] = cellProperties( background.color = 'gray' )
    doc = addFlexTable( doc, flextable = MyFTable )
"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

MyFTable = FlexTable( data = iris[1:5, ] )
MyFTable[ 1:2, 4:5] = cellProperties( background.color = 'gray' )
doc = addFlexTable( doc, flextable = MyFTable )


doc = addTitle( doc, value = "Border formatting properties", level = 2, id = "borderProperties" )

mkd = "
Create a `borderProperties` object that describes border formatting properties.

A borderProperties object is used with `FlexTable` objects and with `parProperties`
objects.

See below the list of supported properties:
"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )
MyFTable = FlexTable( data = arguments[ arguments$Function=="borderProperties", -1]
  , header.text.props=textBold( color = "#1A2530" )
)
MyFTable = setZebraStyle( MyFTable, odd = "#eeeeee", even = "#dddddd" )
MyFTable = setFlexTableBorders( MyFTable
  , inner.vertical = borderProperties( style = "none" )
  , inner.horizontal = borderProperties( color = "#1A2530" )
  , outer.vertical = borderProperties( width = 2, color = "#1A2530" )
  , outer.horizontal = borderProperties( width = 2, color = "#1A2530" )
)

doc = addFlexTable( doc, flextable = MyFTable )


mkd = "

# Change properties

To get modified copies of textProperties, parProperties, and cellProperties objects,
use the function `chprop`.

It makes the code less verbose and makes easier to specify formatting properties on FlexTable.


"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

doc = addRScript(doc, file = "rexamples/chprop_example.R")
source("rexamples/chprop_example.R")
doc = addFlexTable( doc, flextable = MyFTable )

doc <- addTitle(doc, "Shorcut functions", level = 1)
mkd <- "
The following functions are shortcuts for `textProperties` function calls:

* **textNormal**: return default textProperties object.
* **textBold**: return a textProperties object with bold font.
* **textBoldItalic**: return a textProperties object with bold italic font.
* **textItalic**: return a textProperties object with italic font.
"
doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )
mkd <- "The following functions are shortcuts for `parProperties` function calls:

* **parRight**: return a parProperties object with right text alignment.
* **parLeft**: return a parProperties object with left text alignment.
* **parJustify**: return a parProperties object with justified text alignment.
* **parCenter**: return a parProperties object with center text alignment.

"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )


mkd <- "
    MyFTable = FlexTable( data = iris[1:5, ],
      header.text.props = textBold()
    )
    MyFTable[ , 5 ] = textItalic()
    MyFTable[ , 1:4] = parRight()
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )


mkd <- "
The following functions are shortcuts for `borderProperties` function calls: **borderDashed**,
**borderDotted**, **borderSolid** and **borderNone**.
"

doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )

MyFTable = FlexTable( data = iris[1:5, ],
  header.text.props = textBold()
)
MyFTable[ , 5 ] = textItalic()
MyFTable[ , 1:4] = parRight()
doc = addFlexTable( doc, flextable = MyFTable )

source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "formatting_properties.html", ddmenu = "Formatting content")

writeDoc( doc, file = "formatting_properties.html")
