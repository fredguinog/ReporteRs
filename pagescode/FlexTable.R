library( ReporteRs );
library( ggplot2 )
library( XLConnect )

wb <- loadWorkbook( "data/formatting_properties_arguments.xlsx" )
arguments <- readWorksheet(wb, sheet = "arguments")


doc = bsdoc( title = "Reporters - FlexTable",
  description = "Reporters",
  keywords = "ReporteRs, table, format, Word, docx, PowerPoint, pptx, html" )

mkd = "
`FlexTable` is a set of tools
to customize tables, their formats and their contents. Formatting can be done
on cells, paragraphs and text. It also lets you to insert headers and footers
rows with eventually merged cells.
"

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "FlexTable", mkd )


default.par.properties = parProperties(text.align = "justify",
    padding.left = 0)

doc = addTitle( doc, "Table model", level = 1 )
doc = addParagraph( doc, "Below a representation of the table model implemented with FlexTable.", par.properties = default.par.properties )


source("rexamples/data_model.R")

doc = addFlexTable( doc, data_model )

mkd = "
**Header rows**

Header rows are the gray part of the table. A FlexTable can contain contain
several header rows, it can also contain no header rows.

**Body content**

Body content is the blue part of the table.

* It can be formatted (texts, paragraphs and cells)
* Content can be added (from a vector, a data.frame or a matrix).
* Cells can be merged horizontally or vertically.

"
doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )
mkd <- "
**Footer rows**

Footer rows are the light-blue part of the table. A FlexTable can contain contain several footer rows, it can also contain no footer rows.

"
doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )

mkd <- "
# Usage

FlexTable require either argument `data`, a data.frame object or a
matrix, either argument `numrow` and `numcol`.

When data is provided:

* To add row.names, use `add.rownames = TRUE`. Remember that it increments the number
of columns of your table.
* To add data column names as headers, use `header.columns = TRUE`.


"
doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )

mkd <- "
Default format properties can also be specified:

* `body.cell.props`: cellProperties object to apply to body cells.
* `body.par.props`: parProperties object to apply to body cells.
* `body.text.props`: textProperties object to apply to body cells.
* `header.cell.props`: cellProperties object to apply to header and footer cells.
* `header.par.props`: parProperties object to apply to header and footer cells.
* `header.text.props`: textProperties object to apply to header and footer cells.

"
doc = addMarkdown( doc, text = mkd,
                   default.par.properties = default.par.properties )

mkd <- "
Below an example. The following dataset will be used:
"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

source( "rexamples/aggregate_melomania.R" )
doc = addRScript( doc, file = "rexamples/aggregate_melomania.R" )

doc = addRScript( doc,
  text = paste0( "#", capture.output( {data}) , collapse = "\n" )
 )

mkd = "
    doc = addFlexTable( doc, FlexTable(data))
"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

doc = addFlexTable( doc, FlexTable(data))

mkd = "
There are also two shortcut functions to quickly produce FlexTable
objects: `vanilla.table`and `light.table`.

    doc = addFlexTable( doc, vanilla.table(data))
"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

doc = addFlexTable( doc, vanilla.table(data))

mkd = "

# Printing

 If R session is interactive, the FlexTable is rendered in an HTML page
and loaded into a WWW browser. Within RStudio FlexTable is rendered in
the viewer.

# Set columns widths

FlexTables have their columns autosized to the minimum width.
Use `setFlexTableWidths` to specify each columns widths in inches.

    MyFTable = FlexTable( data = data )
    MyFTable = setFlexTableWidths( MyFTable, widths = c(3, 1, 0.5, rep(0.7, 6) ) )
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable( data = data )
    MyFTable = setFlexTableWidths( MyFTable, widths = c(3, 1, 0.5, rep(0.7, 6) ) )

    doc = addFlexTable( doc, MyFTable )


mkd = "
# Merging data cell

Functions `spanFlexTableRows` and `spanFlexTableColumns` are merging
cells of a FlexTable object.

There is a special argument `runs`. It specifies to merge cells that
have identical values along `runs` values.

The following code show usage of this parameter:

    MyFTable = FlexTable(data)
    MyFTable = spanFlexTableRows( MyFTable, j = 'Status', runs = as.character( data$Status ) )

"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable(data)
    MyFTable = spanFlexTableRows( MyFTable, j = 'Status', runs = as.character( data$Status ) )
    doc = addFlexTable( doc, MyFTable )

mkd = "

If argument **runs** is not what you need, there are arguments
`from` and `to` that let you specify which cells are to be span.

    MyFTable = FlexTable(data)
    MyFTable = spanFlexTableColumns( MyFTable, i = 2, from = 2, to = 5 )
    MyFTable = spanFlexTableRows( MyFTable, j = 6, from = 2, to = 5 )

"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable(data)
    MyFTable = spanFlexTableColumns( MyFTable, i = 2, from = 2, to = 5 )
    MyFTable = spanFlexTableRows( MyFTable, j = 6, from = 2, to = 5 )
    doc = addFlexTable( doc, MyFTable )

mkd = "

# Format table

## Change cell background color

    MyFTable = FlexTable(data)
    # change background colors of some cells in the table body
    MyFTable = setFlexTableBackgroundColors(MyFTable, j = 4,
      colors = ifelse(data$Mean < 3, '#DDDDDD', 'orange'))
    # change background colors of a cell in the table header
    MyFTable = setFlexTableBackgroundColors(MyFTable, i = 1, j = 1,
      colors = '#8888F0', to = 'header')
"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable(data)
    # change background colors of some cells in the table body
    MyFTable = setFlexTableBackgroundColors(MyFTable, j = 4,
      colors = ifelse(data$Mean < 3, '#DDDDDD', 'orange'))
    # change background colors of a cell in the table header
    MyFTable = setFlexTableBackgroundColors(MyFTable, i = 1, j = 1,
      colors = '#8888F0', to = 'header')
    doc = addFlexTable( doc, MyFTable )

mkd = "

## Set columns or rows background colors

Modify rows or columns backgroud colors with `setRowsColors` and `setColumnsColors`.

    MyFTable = FlexTable( data = data )
    MyFTable = setRowsColors( MyFTable, i=3:4, colors = '#666633' )
    MyFTable = setColumnsColors( MyFTable, j=3, colors = '#990033' )
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable( data = data )
    MyFTable = setRowsColors( MyFTable, i=3:4, colors = '#666633' )
    MyFTable = setColumnsColors( MyFTable, j=3, colors = '#990033' )
    doc = addFlexTable( doc, MyFTable )


mkd = "

## Zebra striped tables

Modify rows or columns backgroud colors with `setRowsColors` and `setColumnsColors`.

    MyFTable = vanilla.table( data = data )
    MyFTable = setZebraStyle( MyFTable, odd = '#eeeeee', even = 'white' )
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = vanilla.table( data = data )
    MyFTable = setZebraStyle( MyFTable, odd = '#eeeeee', even = 'white' )
    doc = addFlexTable( doc, MyFTable )


mkd = "

## Format cell text values

    MyFTable = FlexTable(data)
    # format body content
    MyFTable[, 7:8] = textProperties( color = '#2BBBD8' )
    # format header content
    MyFTable[, 7:8, to = 'header'] = textProperties( color = '#2BBBD8', font.weight = 'bold' )

"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable(data)
    # change background colors of some cells in the table body
    MyFTable = FlexTable(data)
    # format body content
    MyFTable[, 7:8] = textProperties( color = '#2BBBD8' )
    # format header content
    MyFTable[, 7:8, to = 'header'] = textProperties( color = '#2BBBD8', font.weight = 'bold' )

    doc = addFlexTable( doc, MyFTable )


mkd = "

## Format cells

    MyFTable = FlexTable(data)
    # format body content
    MyFTable[3:4, 'n'] = cellProperties( background.color = 'red' )
    # format header content
    MyFTable[, 'n', to = 'header'] = cellProperties( background.color = 'orange' )
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable(data)
    MyFTable[3:4, 'n'] = cellProperties( background.color = 'red' )
    # format header content
    MyFTable[, 'n', to = 'header'] = cellProperties( background.color = 'orange' )

    doc = addFlexTable( doc, MyFTable )



mkd = "

## Format paragraphs

    MyFTable = FlexTable(data)
    MyFTable = setFlexTableWidths( MyFTable, widths = c(3, 1, 0.5, rep(0.7, 6) ) )
    MyFTable[,'Status'] = parRight()
    MyFTable[,'Status', to = 'header'] = parRight()
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable(data)
MyFTable = setFlexTableWidths( MyFTable, widths = c(3, 1, 0.5, rep(0.7, 6) ) )
    MyFTable[,'Status'] = parRight()
    MyFTable[,'Status', to = 'header'] = parRight()

    doc = addFlexTable( doc, MyFTable )

mkd = "

## Change borders

    MyFTable[ 2:5,'Status', side = 'bottom'] = borderProperties( style = 'dashed' )
    MyFTable[,'Status', to = 'header', side = 'bottom'] = borderProperties( width=3, style = 'dashed' )
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable(data)
    MyFTable[ 2:5,'Status', side = 'bottom'] = borderProperties( style = 'dashed' )
    MyFTable[,'Status', to = 'header', side = 'bottom'] = borderProperties( width=3, style = 'dashed' )

    doc = addFlexTable( doc, MyFTable )




mkd = "

## Conditional formatting example

    # the default cellProperties
    myCellProps = cellProperties( padding = 5 )

    MyFTable = FlexTable( data = data, header.text.props = textBold()
      , header.cell.props = myCellProps
      , body.cell.props= myCellProps )

    # modify the default cellProperties and apply
    # it to cells of columns 4 to 8 where n < 20
    MyFTable[ data$n < 20, 4:8] = chprop( myCellProps, background.color = '#666633')
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable(data)
    # the default cellProperties
    myCellProps = cellProperties( padding = 5 )

    MyFTable = FlexTable( data = data, header.text.props = textBold()
      , header.cell.props = myCellProps
      , body.cell.props= myCellProps )

    # modify the default cellProperties and apply
    # it to cells of columns 4 to 8 where n < 20
    MyFTable[ data$n < 20, 4:8] = chprop( myCellProps, background.color = '#666633')

    doc = addFlexTable( doc, MyFTable )


mkd = "

# Insert content

You can add content with the substract operator.

Function has an argument `text.properties` to specify text formatting properties:

    MyFTable[data$Ulceration!='Absent', 'Ulceration',
      text.properties = textBold( vertical.align = 'superscript')] = '(1)'

And an argument `newpar` to let create new paragraphs into cells.

    MyFTable[1, 1, text.properties = textBold(color = 'red'), newpar = TRUE] = 'newpar usage'

"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable(data)
    MyFTable[data$Ulceration!='Absent', 'Ulceration',
      text.properties = textBold( vertical.align = 'superscript')] = '(1)'
    MyFTable[1, 1, text.properties = textBold(color = 'red'), newpar = TRUE] = 'newpar usage'

    doc = addFlexTable( doc, MyFTable )







mkd = "

# Header Rows

Add header rows with function `addHeaderRow`. As we want to add
specific header rows, `header.columns` needs to be set to **FALSE**.

    MyFTable = FlexTable( data = data, header.columns= FALSE )
    # add first header row
    MyFTable = addHeaderRow( MyFTable, text.properties = textBold(),
      value = c('Factors', 'Summary statistics'), colspan = c( 2, 7)
      )
    # add second header row
    MyFTable = addHeaderRow( MyFTable, value = names( data ),
      text.properties = textBold()
      )
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable( data = data, header.columns= FALSE )
    # add first header row
    MyFTable = addHeaderRow( MyFTable, text.properties = textBold(),
      value = c('Factors', 'Summary statistics'), colspan = c( 2, 7)
      )
    # add second header row
    MyFTable = addHeaderRow( MyFTable, value = names( data ),
      text.properties = textBold()
      )
    doc = addFlexTable( doc, MyFTable )



mkd = "

# Footer Rows

Add footer rows with function `addFooterRow`.

    MyFTable = FlexTable( data = data )
    # add first header row
    MyFTable = addFooterRow( MyFTable, value = 'Summarized with dplyr',
      colspan = 9, text.properties = textBoldItalic()
    )
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

    MyFTable = FlexTable( data = data )
    # add first header row
    MyFTable = addFooterRow( MyFTable, value = 'Summarized with dplyr',
      colspan = 9, text.properties = textBoldItalic()
    )

    doc = addFlexTable( doc, MyFTable )







source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "FlexTable.html", ddmenu = "Formatting content")

writeDoc( doc, file = "FlexTable.html")
