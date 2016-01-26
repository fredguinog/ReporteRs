library( ReporteRs )
library( ggplot2 )

mydoc = pptx( title = 'title', template = 'templates/pp_example.pptx' )

myplot = qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width, alpha = I(0.7))

mydoc = addSlide( mydoc, slide.layout = 'Title and Content', bookmark = 3 )

mydoc = addTitle( mydoc, 'my new graph')

mydoc = addPlot( mydoc, print, x = myplot )

writeDoc( mydoc, 'examples/pp_replacement.pptx' )
