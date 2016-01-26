library( ggplot2 )
library( ReporteRs )

pptdoc = pptx( )
pptdoc = addSlide( pptdoc, "Two Content" )

myggplot = qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width )

# use Helvetica as font
pptdoc = addPlot( doc = pptdoc
 , fun = print
 , x = myggplot + ggtitle("fontname Helvetica")
 , vector.graphic=TRUE
 , fontname = "Helvetica" )

# use Courier New as font
pptdoc = addPlot( doc = pptdoc
 , fun = print
 , x = myggplot + ggtitle("fontname Courier New")
 , vector.graphic=TRUE
 , fontname = "Courier New" )

writeDoc( pptdoc, "examples/pp_plot_fontname.pptx" )
