library( ReporteRs );
library( ggplot2 )

doc = bsdoc( title = "Reporters - FlexTable examples", 
  description = "Reporters, FlexTable examples", 
  keywords = "ReporteRs, table, flextable, example, Word, docx, PowerPoint, pptx, html" )

mkd = "
See below some examples.
"

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "FlexTable examples", mkd )

default.par.properties = parProperties(text.align = "justify", 
    padding.left = 0)

doc = addTitle( doc, value = "Correlation matrix", level = 1 )
source("rexamples/corrFT.R")
doc = addFlexTable( doc, corrFT )
doc = addRScript( doc, file = "rexamples/corrFT.R" )

doc = addTitle( doc, value = "Clinical like table", level = 1 )
doc = addTitle( doc, value = "Example 1", level = 2 )
source("rexamples/MyFTable.R")
doc = addFlexTable( doc, MyFTable )
doc = addRScript( doc, file = "rexamples/MyFTable.R" )

doc = addTitle( doc, value = "Example 2", level = 2 )
source("rexamples/long.FT.R")

doc = addFlexTable( doc, longFT )
doc = addParagraph( doc, pot( "You will need the following file ", format = textNormal() ) + 
    pot( "long.data.R", 
      textNormal(color = "#428bca", underlined = TRUE ), 
      hyperlink = "./data/long.data.R" ), par.properties = default.par.properties
)
doc = addRScript( doc, file = "rexamples/long.FT.R" )

doc = addTitle( doc, value = "Model summary table", level = 1 )
source("rexamples/coef_ft.R")
doc = addFlexTable( doc, coef_ft )
doc = addRScript( doc, file = "rexamples/coef_ft.R" )

doc = addTitle( doc, value = "Conditional colored table", level = 1 )
source("rexamples/my_ft.R")
doc = addFlexTable( doc, my_ft )
doc = addRScript( doc, file = "rexamples/my_ft.R" )


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "flextable_examples.html", ddmenu = "Formatting content")

writeDoc( doc, file = "flextable_examples.html")
