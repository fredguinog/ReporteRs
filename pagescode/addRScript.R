library( ReporteRs );
library( ggplot2 )
options("ReporteRs-fontsize" = 11 )

doc = bsdoc( title = "Reporters - addRScript", 
  description = "Reporters, add rscript", 
  keywords = "ReporteRs, r code, Word, docx, PowerPoint, pptx, html, vector graphics, svg" )

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Function addRScript", "add highlighted R script  
to documents." )


default.par.properties = parProperties(text.align = "justify", padding.left = 0)

mkd = "
# Usage

To add an R script, use function `addRScript`. Specify R script with 
one of the following argument:

* with argument `text`, add r script as text.
* with argument `file`, add r script located in a file.

# Example
    myrcode = 'x = rnorm(100)
    plot(density( x ) )'
    doc = addRScript(doc, text = myrcode )

The above code will produce the following output:
"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

    doc = addRScript(doc, text = 'x = rnorm(100)
plot( density( x ) )'
    )


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "addRScript.html", ddmenu = "Main functions")

writeDoc( doc, file = "addRScript.html")
