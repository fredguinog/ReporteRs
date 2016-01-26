my_text_prop = textProperties(color='#1163A5', 
  font.size = 20, font.weight = 'bold', font.family = 'Courier New' )

my_text = pot( value = 'My tailor', format = my_text_prop ) +
  ' is rich. ' +
  pot( value = 'Cats', format = chprop( my_text_prop, color = '#F0A91B') ) +
  ' and ' + 
  pot( value = 'dogs', format = chprop( my_text_prop, color = '#D63C3A') )
