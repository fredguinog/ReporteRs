addBigText = function(doc, title, mkd ){
  doc = addParagraph( doc, value = pot( title, 
    format = textNormal(font.size = 28, color = "#34495E") ), 
    par.properties = parCenter( padding = 12 ) )

  doc = addMarkdown( doc, text = mkd, 
    text.properties = textNormal(font.size = 18, color = "#606060"),
    default.par.properties = parCenter(padding = 0) )
  
  doc
}

