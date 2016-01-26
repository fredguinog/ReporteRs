library( ReporteRs );
library( ggplot2 )
options("ReporteRs-fontsize" = 11 )

doc = bsdoc( title = "Reporters - addPlot",
  description = "Reporters, add plot",
  keywords = "ReporteRs, plot, image, Word, docx, PowerPoint, pptx, html, vector graphics, svg" )

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Function addPlot", "add plot to document objects." )

default.par.properties = parProperties(text.align = "justify",
    padding.left = 0)

mkd = "
# Overview

* Insert plots into the output document. Function works
with all R plots (base graphics but also lattice, ggplot and grid)
* Choose between raster format (png) or vector graphics format (**editable in pptx and docx**).

# Usage

Function `addPlot` has 2 main arguments: `fun` and `...`.

Argument `fun` is an argument of class *function*. Production of plots
is done by this function. If this function requires parameters,
add them as parameters (the `...` argument).

## Base graphics

Specify your R plot commands with the `fun` argument. You can also encapsulate
the plot command within a simple function. See following examples:

    doc = addPlot( doc = doc,
      fun = plot, x = rnorm( 10 ), y = rnorm( 10 ), main = \"base graphics\",
        par.properties = parCenter() )

    doc = addPlot( doc = doc, fun = function( ){
      plot( x = rnorm( 10 ), y = rnorm( 10 ), main = \"base graphics\",
        par.properties = parCenter() )
    } )
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

doc = addPlot( doc = doc,
  fun = plot, x = rnorm( 10 ), y = rnorm( 10 ), main = "base graphics",
  par.properties = parCenter() )

# doc = addPlot( doc = doc, fun = function( ){
#   plot( x = rnorm( 10 ), y = rnorm( 10 ), main = "base graphics" )
# } )

mkd = "## ggplot, grid and lattice graphics objects

Call explicitly `print` function on the graph object.

    library( 'ggplot2' )
    myggplot = qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width )
    doc = addPlot( doc = doc , fun = print, x = myggplot )
    # or:
    # doc = addPlot( doc = doc , fun = function(x) print(myggplot) )
"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

myggplot = qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width )
doc = addPlot( doc = doc , fun = print, x = myggplot )

mkd = "To combine multiple plots in one call, create a function to execute all plotting instructions:

    myggplot = qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width )

    myplotfunction = function( ) {
      print( myggplot )
      plot( x = rnorm( 10 ), y = rnorm( 10 ), main = \"main title\" )
    }

    doc = addPlot( doc = doc , fun = myplotfunction )
"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

mkd = "# Specifying dimensions

Arguments `width` and `height` are specifying plot width and height in
inches (default values are 6 and 6).

When the document is a `pptx` object, width and height don't need to be specified.
They are defined by the width and height of the shape that will contain the graphics.
This dimensions can be defined in the layout of the PowerPoint template used to
create the `pptx` object.

# Editable graphics

When producing vector graphics for docx or pptx objects, plots are editable.
They can be modified, annotated, etc. in Word and in PowerPoint documents.

Use `editable=FALSE` with addPlot to desable this feature.

**Note also that Word version should be > 2007 to be able to read these graphics.**

# Interactive graphics

`bsdoc` object can embed interactive ggplot2 graphics with package `ggiraph`.

There are three interactive features: popup text when mouse is over an
element, execute javascript instructions when clicking the element and
assign id to graphical element to play with them later (e.g. on click).

"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

doc = addPlot( doc, fun = function(){
  source( "rexamples/add_interactive_plot.R" )
}, width = 8, height = 8 )

doc = addRScript( doc, file = "rexamples/add_interactive_plot.R")

mkd = "
# Optional arguments

## Point size

Argument pointsize is the default pointsize in pixel of plotted text.

    doc = addPlot( doc = doc,
      fun = plot, x = 1:10, y = 1:10, type='l', main = 'pointsize=10',
      pointsize=10
      )
    doc = addPlot( doc = doc,
      fun = plot, x = 1:10, y = 1:10, type='l', main = 'pointsize=20',
      pointsize=20
    )

"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )
doc = addPlot( doc = doc,
  fun = plot, x = 1:10, y = 1:10, type='l', main = 'pointsize=10',
  pointsize=10
  )
doc = addPlot( doc = doc,
  fun = plot, x = 1:10, y = 1:10, type='l', main = 'pointsize=20',
  pointsize=20
)



mkd = "## Vector graphics

Vector graphics are high quality graphics. Argument `vector.graphic` is a boolean value, if **TRUE** vector graphics
will be produced, if **FALSE** raster graphics will be produced (*png*).

If document is a pptx or a docx object, produced graphics will be editable (DrawingML format);
colors, text can be modified later in the produced document.

Don't use vector graphics if document is a docx and MS Word version used to
open the document is 2007.

"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )


options("ReporteRs-fontsize" = 11 )

source("rexamples/powerpoint_plot_vector_graphics.R")
doc = addRScript( doc, file = "rexamples/powerpoint_plot_vector_graphics.R" )
options("ReporteRs-fontsize" = 11 )

doc = addParagraph( doc, pot( "The following script is producing file ", format = textNormal() ) +
    pot( "pp_plot_vg.pptx",
      textNormal(color = "#428bca", underlined = TRUE ),
      hyperlink = "./examples/pp_plot_vg.pptx" ), par.properties = default.par.properties
)

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(),
  src = "http://www.slideshare.net/slideshow/embed_code/37138852")

mkd = "## Plot fontname

Argument `fontname` is the default font to use (default to 'Helvetica')

This parameter won't have any effect if `vector.graphic` is not **TRUE**.
"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )



options("ReporteRs-fontsize" = 11 )

source("rexamples/powerpoint_plot_fontname.R")
doc = addRScript( doc, file = "rexamples/powerpoint_plot_fontname.R" )
options("ReporteRs-fontsize" = 11 )

doc = addParagraph( doc, pot( "The following script is producing file ", format = textNormal() ) +
    pot( "pp_plot_fontname.pptx",
      textNormal(color = "#428bca", underlined = TRUE ),
      hyperlink = "./examples/pp_plot_fontname.pptx" ), par.properties = default.par.properties
)

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(),
  src = "http://www.slideshare.net/slideshow/embed_code/37138512")


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "addPlot.html", ddmenu = "Main functions")

writeDoc( doc, file = "addPlot.html")
