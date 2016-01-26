library(rtable)

MyFTable = FlexTable( data = mtcars[1:15, ]
  , header.cell.props=cellProperties(background.color="#003366")
  , header.text.props=textBold( color="white")
  , add.rownames=TRUE
)
# Zebra striped table
MyFTable = setZebraStyle( MyFTable, odd = "#DDDDDD", even = "#FFFFFF" )

