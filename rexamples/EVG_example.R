require( ReporteRs )
require( ggplot2 )

myplot = qplot(Sepal.Length, Petal.Length
  , data = iris, color = Species
  , size = Petal.Width, alpha = I(0.7) )


# Create a new document
mydoc = pptx( title = "EVG demo" )

mydoc = addSlide( mydoc, "Two Content" )
mydoc = addTitle( mydoc, "Vector graphics format versus raster format" )
mydoc = addPlot( mydoc, function( ) print( myplot ), vector.graphic = TRUE )
mydoc = addPlot( mydoc, function( ) print( myplot ), vector.graphic = FALSE )

# write the mydoc
writeDoc( mydoc, file = "examples/EVG_example.pptx")
