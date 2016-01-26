library( ReporteRs )
library( ggplot2 )

mydoc = pptx( title = "title" )

mydoc = addSlide( mydoc, slide.layout = "Title and Content" )

myplot = qplot(Sepal.Length, Petal.Length, data = iris, 
  color = Species, size = Petal.Width, alpha = I(0.7) )

mydoc = addPlot( doc = mydoc, fun = print, x = myplot, 
  offx = 1, offy = 1, width = 6, height = 5 )

mydoc = addFlexTable( doc = mydoc, FlexTable( head( iris ) ),
  offx = 8, offy = 2, width = 4.5, height = 3 )

writeDoc( mydoc, file = "examples/pp_force_pos.pptx" )
