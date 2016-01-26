library( ReporteRs );
library( ggplot2 )

options("ReporteRs-fontsize" = 11 )


doc = bsdoc( title = "Reporters - HTML chunks", 
  description = "Reporters, HTML chunks", 
  keywords = "ReporteRs, html, knitr, shiny" )

mkd = "Get HTML code from ReporteRs objects."
source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "HTML chunks", mkd )



default.par.properties = parProperties(text.align = "justify", 
    padding.left = 0)

mkd = "
# Usage

`rtable` package let you use FlexTable objects in 
knitr documents and shiny applications.  

"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )


mkd = "

# shiny Example

    ## ui.r
    #
    ...
    tableOutput('flextable')
    ...
    ## server.r
    #
    library( rtable )
    #...
    output$flextable <- renderFlexTable({
        MyFTable    
      })
    #...


"
# If you want to get more examples, I strongly recommend to have a look 
# at [Victor Perrier] (perrier.victor@gmail.com) 's Github. Victor wrote 
# nice examples showing usage of ReporteRs inside shiny applications. 


doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

# doc = ReporteRs::addImage( doc, filename = "figure/victor_example4.png", width = 812/72, height = 690/72)


mkd = "
You can view these examples here: [Apps_ReporteRs](http://github.com/pvictor/Apps_ReporteRs). 

You can run these shiny examples using the following R commands:

    library(shiny)
    runGitHub(repo = 'Apps_ReporteRs', username = 'pvictor', subdir = 'Example_1')
    runGitHub(repo = 'Apps_ReporteRs', username = 'pvictor', subdir = 'Example_2')
    runGitHub(repo = 'Apps_ReporteRs', username = 'pvictor', subdir = 'Example_3')
    runGitHub(repo = 'Apps_ReporteRs', username = 'pvictor', subdir = 'Example_4')
    runGitHub(repo = 'Apps_ReporteRs', username = 'pvictor', subdir = 'Example_5')
    runGitHub(repo = 'Apps_ReporteRs', username = 'pvictor', subdir = 'Example_6')

"

# doc = addMarkdown( doc, text = mkd, 
#   default.par.properties = default.par.properties )

doc = addTitle( doc, value = "knitr example", level = 1 )

source("rexamples/knitr_FlexTable.R")
# source("rexamples/pot_example_full_demo.R")

doc = addRScript( doc, file = "rexamples/knitr_FlexTable.R" )
# doc = addRScript( doc, file = "rexamples/pot_example_full_demo.R" )

mkd = "

`&#96;&#96;&#96;{r}`

    MyFTable

`&#96;&#96;&#96;`

"
doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "html_chunks.html", ddmenu = "HTML")

writeDoc( doc, file = "html_chunks.html")
