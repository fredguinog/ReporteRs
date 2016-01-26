library( ReporteRs )
require( ggplot2 )

mydoc = pptx( title = "title" )

# display layouts names
slide.layouts( mydoc )

# Add a Title slide -------------------------------------------------------
mydoc = addSlide( mydoc, slide.layout = "Title Slide" )

mydoc = addTitle( mydoc, "Presentation title" ) #set the main title
mydoc = addSubtitle( mydoc , "This document is generated with ReporteRs.")#set the sub-title


# plot demo ---------------------------------------------------------------
mydoc = addSlide( mydoc, slide.layout = "Title and Content" )
mydoc = addTitle( mydoc, "Plot examples" )

myplot = qplot(Sepal.Length, Petal.Length
		, data = iris, color = Species
		, size = Petal.Width, alpha = I(0.7)
)
# Add titles and then 'myplot'
mydoc = addPlot( mydoc, function( ) print( myplot ) )

# Add page number, date, footer
mydoc = addPageNumber(mydoc)
mydoc = addDate(mydoc)
mydoc = addFooter(mydoc, "Modify the graph within PowerPoint")

# FlexTable demo ----------------------------------------------------------
mydoc = addSlide( mydoc, slide.layout = "Title and Content" )
mydoc = addTitle( mydoc, "FlexTable example" )

options( "ReporteRs-fontsize" = 12 )

# Create a FlexTable with data.frame mtcars, display rownames
# use different formatting properties for header and body cells
MyFTable = FlexTable( data = mtcars[1:15,], add.rownames = TRUE
		, body.cell.props = cellProperties( border.color = "#EDBD3E")
		, header.cell.props = cellProperties( background.color = "#5B7778" )
)
# zebra stripes - alternate colored backgrounds on table rows
MyFTable = setZebraStyle( MyFTable, odd = "#DDDDDD", even = "#FFFFFF" )
MyFTable = setFlexTableWidths( MyFTable, widths = c(2,rep(.7,11)))

# applies a border grid on table
MyFTable = setFlexTableBorders(MyFTable
	, inner.vertical = borderProperties( color="#EDBD3E", style="dotted" )
	, inner.horizontal = borderProperties( color = "#EDBD3E", style = "none" )
	, outer.vertical = borderProperties( color = "#EDBD3E", style = "solid" )
	, outer.horizontal = borderProperties( color = "#EDBD3E", style = "solid" )
)

# add MyFTable into document 
mydoc = addFlexTable( mydoc, MyFTable )

# Text demo ----------------------------------------------------------------
# set default font size to 26
options( "ReporteRs-fontsize" = 26 )

# add a slide with layout "Title and Content" then add content
mydoc = addSlide( mydoc, slide.layout = "Two Content" )

# add a title
mydoc = addTitle( mydoc, "Texts demo" )
texts = c( "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
  , "In sit amet ipsum tellus. Vivamus dignissim arcu sit amet faucibus auctor."
	, "Quisque dictum tristique ligula."
)

# add simple text
mydoc = addParagraph( mydoc, value = texts  )

# Add "My tailor is rich" and "Cats and Dogs"
# format some of the pieces of text
pot1 = pot("My tailor" , textProperties(color="red" ) ) + " is " + pot("rich", textProperties(font.weight="bold") )
pot2 = pot("Cats", textProperties(color="red" ) ) + " and " + pot("Dogs", textProperties(color="blue" ) )

mydoc = addParagraph(mydoc, set_of_paragraphs( pot1, pot2 ) )

writeDoc( mydoc, file = "examples/pp_long_demo.pptx" )
