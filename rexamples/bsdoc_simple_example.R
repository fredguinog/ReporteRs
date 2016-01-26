library( ReporteRs )

# Creation of mydoc, a mydocx object
mydoc = bsdoc( title = 'my document' )

# add into mydoc first 10 lines of iris
mydoc = addFlexTable( mydoc, vanilla.table(iris[1:10,] ) )

mydoc = addParagraph( mydoc, value = "Hello World!" )

# add a plot into mydoc 
mydoc = addPlot( mydoc, function() barplot( 1:8, col = 1:8 ) )

# write the doc 
writeDoc( mydoc, file = "examples/htmloutput/bsdoc_simple_example.html" )
