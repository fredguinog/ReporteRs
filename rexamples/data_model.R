data = data.frame( 
  header_1 = c("data[1,1]", "data[2,1]", "...", "data[<code>n</code>,1]" )
  , header_2 = c("data[1,2]", "data[2,2]", "...", "data[<code>n</code>,2]" )
  , header_3 = c("data[1,...]", "data[2,...]", "...", "data[<code>n</code>,...]" )
  , header_... = c("data[1,...]", "data[2,...]", "...", "data[<code>n</code>,...]" )
  , header_p = c("data[1,<code>p</code>]", "data[2,<code>p</code>]", "...", "data[<code>n</code>,<code>p</code>]" )
)
data_model = FlexTable( data = data
  	, header.columns = FALSE )
data_model[ , 1:5] = textProperties( color="#DCDDD8" )
data_model[ , 1:5] = parProperties( text.align="right" )
data_model[ , 1:5] = cellProperties( background.color="#475F77")

headerRow = FlexRow()
headerRow[1] = FlexCell( pot( "Grouped header 1.1", format=textProperties(font.weight="bold") ), cell.properties = cellProperties( background.color="#DCDDD8"), colspan = 5 )
data_model = addHeaderRow( data_model, headerRow)

headerRow = FlexRow()
headerRow[1] = FlexCell( pot( "Grouped header 2.1", format=textProperties(font.weight="bold") ), cell.properties = cellProperties( background.color="#DCDDD8"), colspan = 2 )
headerRow[2] = FlexCell( pot( "Grouped header 2.2", format=textProperties(font.weight="bold") ), cell.properties = cellProperties( background.color="#DCDDD8"), colspan = 3 )
data_model = addHeaderRow( data_model, headerRow)

headerRow = FlexRow()
for(i in 1:ncol(data))
	headerRow[i] = FlexCell( pot( names(data)[i], format=textProperties(font.weight="bold") ), cell.properties = cellProperties( background.color="#DCDDD8") )
data_model = addHeaderRow( data_model, headerRow)


footerRow = FlexRow()
footerRow[1] = FlexCell( pot( "Grouped footer 1.1", format=textProperties(font.weight="bold") ), cell.properties = cellProperties( background.color="#2BBBD8"), colspan = 2 )
footerRow[2] = FlexCell( pot( "Grouped footer 1.2", format=textProperties(font.weight="bold") ), cell.properties = cellProperties( background.color="#2BBBD8"), colspan = 3 )
data_model = addFooterRow( data_model, footerRow)
#
footerRow = FlexRow()
footerRow[1] = FlexCell( pot( "Grouped footer 2.1", format=textProperties(font.weight="bold") ), cell.properties = cellProperties( background.color="#2BBBD8"), colspan = 5 )
data_model = addFooterRow( data_model, footerRow)


