library( ReporteRs )
library( ggplot2 )

mydoc = docx( template = "templates/word_bookmark_template.docx" )

# replace bookmarks 'AUTHOR' and 'REVIEWER'
# by dummy values
mydoc = addParagraph( mydoc
  , value = c( "James Sonny Crockett", "Ricardo Rico Tubbs" )	
	, stylename = "small"
	, bookmark = "AUTHOR" )
mydoc = addParagraph( mydoc
	, value = c( "Martin Marty Castillo" )	
	, stylename = "small"
	, bookmark = "REVIEWER" )


MyFTable = FlexTable( data = mtcars[1:10, ]
	, add.rownames=TRUE
)

# replace bookmarks 'DATA'
mydoc = addFlexTable( mydoc
	, MyFTable
	, bookmark = "DATA" )

myplot1 = qplot(Sepal.Length, Petal.Length
  , data = iris, color = Species
  , size = Petal.Width, alpha = I(0.7)
)

# replace bookmarks 'PLOT'
mydoc = addPlot( mydoc
	, fun = print, x = myplot1
	, bookmark = "PLOT"
  )

writeDoc( mydoc, file = "examples/word_replacement.docx")
