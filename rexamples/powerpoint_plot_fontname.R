library( ggplot2 )
library( ReporteRs )

pptdoc = pptx( )
pptdoc = addSlide( pptdoc, "Blank" )

myggplot = qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width )

# use Helvetica as font
pptdoc = addPlot(
  doc = pptdoc,
  fun = print,
  offx = 1, offy = 1, width = 5, height = 5,
  x = myggplot + ggtitle("fontname Helvetica"),
  vector.graphic=TRUE,
  fontname_serif = "Helvetica")

# use Courier New as font
pptdoc = addPlot(
  doc = pptdoc,
  fun = print,
  offx = 6, offy = 1, width = 5, height = 5,
  x = myggplot + ggtitle("fontname Courier New")
 , vector.graphic=TRUE
 , fontname_serif = "Courier New" )

writeDoc( pptdoc, "examples/pp_plot_fontname.pptx" )
