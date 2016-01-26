library( ReporteRs )
library( ggplot2 )

# Create a new document
mydoc = docx( title = "Tables of contents - demo", template = "templates/template_toc.docx" )

# display available styles
styles( mydoc )

mydoc = addTitle( mydoc, "Table of contents", level =  1 )

# add a table of content
mydoc = addTOC( mydoc )

mydoc = addPageBreak( mydoc )

mydoc = addTitle( mydoc, "List of graphics", level =  1 )
mydoc = addTOC( mydoc, stylename = "figurereference" )

mydoc = addTitle( mydoc, "List of tables", level =  1 )
mydoc = addTOC( mydoc, stylename = "tablereference" )

mydoc = addPageBreak( mydoc )

mydoc = addTitle( mydoc, "iris outputs", level =  1 )

myplot1 = qplot(Sepal.Length, Petal.Length
  , data = iris, color = Species
  , size = Petal.Width, alpha = I(0.7)
)

mydoc = addTitle( mydoc, "Plot", level =  2 )

mydoc = addPlot( mydoc, function( ) print( myplot1 ) )
# Add a legend below the plot
mydoc = addParagraph( mydoc, value = "iris plot", stylename = "figurereference")

mydoc = addTitle( mydoc, "Table", level =  2 )

mydoc = addFlexTable( mydoc, vanilla.table( head( iris ) ) )
# Add a legend below the table
mydoc = addParagraph( mydoc, value = "iris table", stylename = "tablereference")


mydoc = addTitle( mydoc, "mtcars outputs", level =  1 )

myplot2 = qplot(mpg, wt, data = mtcars, colour = cyl )

mydoc = addTitle( mydoc, "Plot", level =  2 )

mydoc = addPlot( mydoc, function( ) print( myplot2 ) )
# Add a legend below the plot
mydoc = addParagraph( mydoc, value = "mtcars plot", stylename = "figurereference")

mydoc = addTitle( mydoc, "Table", level =  2 )

mydoc = addFlexTable( mydoc, vanilla.table( head( mtcars[,1:6] ) ) )
# Add a legend below the table
mydoc = addParagraph( mydoc, value = "mtcars table", stylename = "tablereference")

writeDoc( mydoc, file = "examples/toc_demo.docx")
