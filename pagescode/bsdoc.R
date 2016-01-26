library( ReporteRs );
library( ggplot2 )

options("ReporteRs-fontsize" = 11 )


doc = bsdoc( title = "Reporters - HTML",
  description = "Reporters, Bootstrap Document",
  keywords = "ReporteRs, html, Bootstrap" )

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "HTML document", "Create HTML documents from R with bsdoc objects.

The generated files will integrate Twitter [Bootstrap](http://getbootstrap.com/) theme" )


default.par.properties = parProperties(text.align = "justify", padding.left = 0)

mkd = "
# Getting Started

## Create a bsdoc object

Use the function `bsdoc` to create an r object representing an HTML document.

## Send R outputs into that object

Next, you create the components of your html file. You create
and format text, then insert it using the addParagraph function.
You create and insert tables, perhaps merging cells, changing
row and column colors or fonts. And, of course, you add plots.
Tables, plots and paragraphs formats can be customised with
dedicated functions.

## Write the object to a file

Finally, using `writeDoc`, you write the object into a file
with the suffix *.html* on your file system. Note that other files
will be copied in the directory containing the html file (i.e. the bootstrap
css, js directories).

## Example

Below you can follow this process with a commented R script:
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

source("rexamples/bsdoc_simple_example.R")
doc = addRScript( doc, file = "rexamples/bsdoc_simple_example.R" )

doc = addParagraph( doc, pot( "The following script is producing file ", format = textNormal() ) +
    pot( "bsdoc_simple_example.html",
      textNormal(color = "#428bca", underlined = TRUE ),
      hyperlink = "./examples/htmloutput/bsdoc_simple_example.html" ), par.properties = default.par.properties
)

mkd = "
# Function list

The following functions can only be used with `bsdoc` objects:

* Add a title: [addTitle](./addTitle.html)
* Add a table: addFlexTable - see [FlexTable](./FlexTable.html)  and [addFlexTable](./addFlexTable.html)
* Add plots: see [addPlot](./addPlot.html)
* Add external images: see [addImage](./addImage.html)
* Add syntax highlighted R code: see [addRScript](./addRScript.html)
* Add paragraphs of text: see [addParagraph](./addParagraph.html)
* Add markdown: see [addMarkdown](./markdown.html)
* Write the document into a file: see [writeDoc](./writeDoc.html)
* Create a `Footnote` to add into a [pot](./pot_objects.html) object.
* Add a BootstrapMenu (the same used above in this web page):
See *Specific functions/BootstrapMenu* below.
* Add a Footer (the same used below in this web page):
See *Specific functions/addFooter* below.


# Specific functions

## BootstrapMenu

BootstrapMenu serve as navigation headers for bsdoc documents.
a BootstrapMenu is collapsed (and toggleable) in mobile views
and become horizontal as the available viewport width increases.

    mymenu = BoostrapMenu( title = 'my title')

    mydd = DropDownMenu( label = 'Mon menu' )
    mydd = addLinkItem( mydd, label = 'GitHub', 'http://github.com/')
    mydd = addLinkItem( mydd, separator.after = TRUE)
    mydd = addLinkItem( mydd, label = 'Wikipedia', 'http://www.wikipedia.fr')

    mymenu = addLinkItem( mymenu, label = 'ReporteRs', 'http://github.com/davidgohel/ReporteRs')
    mymenu = addLinkItem( mymenu, dd = mydd )

    doc = addBootstrapMenu( doc, mymenu )

## addFooter

You can add text in footer of a bsdoc object. The function
has the same behaviour than addParagraph, except that its
content will be written in the footer part of the bsdoc instead
of the body of the document.

    doc = addFooter( doc, value = pot( 'Code licensed under ', format = textProperties(color='gray') ) +
      pot('GPL-3', format = textProperties(color='#428bca'),
        hyperlink = 'https://gnu.org/licenses/gpl.html' ) +
      pot('.', format = textProperties(color='gray') ),
      par.properties = parCenter( padding = 2 )
    )

## Interactive plots

Package `ggiraph` will let you add interactivity in
`ggplot` plots. With custom geom function, ggplot graphical
elements can be linked with javascript actions,
tooltips and data id.

`ggiraph` can be found [here](http://github.com/davidgohel/ggiraph) and a
vignette is available [here](http://davidgohel.github.io/ggiraph/introduction.html).
It is not on cran yet.

**See example in section [addPlot](./addPlot.html).**

"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )



source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "bsdoc.html", ddmenu = "HTML")

writeDoc( doc, file = "bsdoc.html")
