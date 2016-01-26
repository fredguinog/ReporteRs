options('ReporteRs-fontsize'=12, 'ReporteRs-default-font'='Arial')

my_text_prop = textNormal()

my_note = pot("*", chprop( my_text_prop, vertical.align = "superscript", color = "red") ) + 
  pot(" This is a note"
  , chprop( my_text_prop, font.style = "italic", color = "brown" ) )

MyFTable = FlexTable( data = mtcars[1:5, ], add.rownames = TRUE )

MyFTable[ 1, 1, chprop( my_text_prop, vertical.align = "superscript", color = "red" ) ] = "*"

MyFTable = addFooterRow( MyFTable, value = '',
  colspan = ncol(mtcars) + 1
)
MyFTable[1,1, to = 'footer'] = my_note

mydoc = docx( )

# add text with stylename BulletList - use set_of_paragraphs
mydoc = addFlexTable( mydoc, MyFTable )

writeDoc( mydoc, file = "examples/word_pot_cell_demo.docx" )
