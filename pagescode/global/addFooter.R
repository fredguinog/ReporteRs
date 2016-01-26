doc = addFooter( doc, pot( "Maintained by David Gohel.", 
  format = textProperties(color="gray") ), parCenter( padding = 0 ) )
doc = addFooter( doc, 
  pot( "Code licensed under ", format = textProperties(color="gray") ) + 
    pot("GPL-3", format = textProperties(color="#428bca"), 
      hyperlink = "https://gnu.org/licenses/gpl.html" ) + pot(".", format = textProperties(color="gray") ), 
  parCenter( padding = 0 ) 
)
doc = addFooter( doc, 
  pot( "Currently v0.8.0 - ", format = textProperties(color="gray") ) + 
  pot( "GitHub", format = textProperties(color="#428bca"), hyperlink = "http://github.com/davidgohel/ReporteRs" ) + 
  pot( " - ", format = textProperties(color="gray") ) +
  pot( "Issues", format = textProperties(color="#428bca"), hyperlink = "http://github.com/davidgohel/ReporteRs/issues" ) + 
  pot( " - ", format = textProperties(color="gray") ) +
  pot( "Releases", format = textProperties(color="#428bca"), hyperlink = "http://github.com/davidgohel/ReporteRs/releases" ) + 
  pot( " - ", format = textProperties(color="gray") ) +
  pot( "Mailing list", format = textProperties(color="#428bca"), hyperlink = "http://groups.google.com/group/reporters-package" ), 
  parCenter( padding = 0 ) 
)
