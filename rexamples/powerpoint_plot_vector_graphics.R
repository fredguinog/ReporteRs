library( ggplot2 )
library( ReporteRs )

pptdoc = pptx( )
pptdoc = addSlide( pptdoc, "Two Content" )

myggplot = qplot(Sepal.Length, Petal.Length, data = iris, 
  color = Species, size = Petal.Width )

# vector.graphic = TRUE
pptdoc = addPlot( doc = pptdoc,
  fun = print,
  x = myggplot + ggtitle("Vector Graphic"),
  vector.graphic = TRUE
)

# vector.graphic = FALSE
pptdoc = addPlot( doc = pptdoc,
  fun = print,
  x = myggplot + ggtitle("Raster Graphic (png)"),
  vector.graphic = FALSE
)

writeDoc( pptdoc, "examples/pp_plot_vg.pptx" )
