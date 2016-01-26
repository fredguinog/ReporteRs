base_text_prop = textProperties( font.size = 10, color = "#3D3234" )
base_par_prop = parProperties( text.align = "right" )
base_cell_prop = cellProperties( padding = 0 )

MyFTable = FlexTable( data = iris[1:5, ], 
  header.cell.props = base_cell_prop, 
  header.par.props = base_par_prop, 
  header.text.props = chprop(base_text_prop, font.weight = "bold" ), 
  body.cell.props = base_cell_prop, 
  body.par.props = base_par_prop, 
  body.text.props = base_text_prop
)
MyFTable[ , 5 ] = chprop( base_par_prop, text.align = "center")
MyFTable[ 3, ] = chprop( base_cell_prop, background.color = "orange" )
MyFTable[ , 1] = chprop( base_text_prop, font.weight = "bold" )
