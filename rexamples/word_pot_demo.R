options('ReporteRs-fontsize'=12, 'ReporteRs-default-font'='Arial')

pot1 = pot("My tailor", textProperties(color="red") ) + " is " + pot("rich"
  , textProperties(font.weight="bold") )

pot2 = pot("Cats", textProperties(color="red") ) + " and " + pot("Dogs"
	, textProperties(color="blue") )

my.pars = set_of_paragraphs( pot1, pot2 )


mydoc = docx( )

# add text with stylename BulletList - use set_of_paragraphs
mydoc = addParagraph( mydoc, value = my.pars, stylename="BulletList" )

mydoc = addPageBreak( mydoc )

# add text with stylename BulletList - add pot after pot
mydoc = addParagraph( mydoc, value = pot1, stylename="BulletList" )
mydoc = addParagraph( mydoc, value = pot2, stylename="BulletList" )

writeDoc( mydoc, file = "examples/word_pot_demo.docx" )
