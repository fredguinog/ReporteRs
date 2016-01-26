library( ReporteRs );
library( ggplot2 )

options("ReporteRs-fontsize" = 11 )


doc = bsdoc( title = "Reporters - Word", 
  description = "Reporters, Word template", 
  keywords = "ReporteRs, Word, template, docx" )

mkd = "
Create Word documents based on existing Word documents.
"
source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Working with Word template file", mkd )


default.par.properties = parProperties(text.align = "justify", 
    padding.left = 0)

mkd = "
# Overview

You can create Word documents based on existing Word documents. 
The function `docx` has an optional argument **template**.

    doc = docx( template = 'your_corporate_template.docx' )

**It loads in memory your template word document to add content to**. 
R outputs will be inserted at the end of that copy (except if you are using bookmarks).

The approach is to use a Word document that contains the layout and main styles of 
your final document.

If you don't direct ReporteRs to a template file, an empty document will be used 
(located into the package directory) and you will have a document with its Word styles.

## Reuse layout and styles

You may need to generate docx documents in a particular corporate template 
(with specific fonts, colour schemes, logos, etc.).

You can edit an existing file in Word, delete the whole content or not, 
modify paragraph styles, headers, etc., and use it as a template. New 
reports will have the same layout and styles than the template.

## Replace content

If you want to replace content into existing Word document, 
you will need to insert bookmarks (used as placeholders to insert 
contents) into this template.

# Reuse styles

Available styles will be paragraph styles of the base document 
(e.g. Normal, Title1, etc.). Names of the returned character vector are 
internal Word labels associated with styles names.

The styles names should only contain letters (from a to z) and 
numbers. For example, in France the default style named `Legend` becomes `L?gende` 
and is returned as `Lgende` by the styles R function. The workaround 
is to create a new style based on `L?gende` and to name it `Legende`. 
It will be then a valid name to use with ReporteRs.

    doc = docx( template = 'templates/template.docx' )
    styles(doc)
"


doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

doc = addRScript( doc, 
  text = paste0( "#", capture.output( {xx=docx( template = 'templates/template.docx' );styles(xx)}) , collapse = "\n" ) 
 )

mkd = "
**styles** are used by several function, adding text with `addParagraph`, 
adding titles with `addTitle` , adding specific TOC with `addTOC`.

## Paragraphs and styles

Function `addParagraph` has an argument `stylename` whose value must 
be one of the names returned by the function `styles`.

We will use the following file as template: [template.docx](templates/template.docx)

The script is producing the following file: [styles_demo.docx](examples/styles_demo.docx)

    library( ReporteRs )
    
    doc = docx( title = 'styles - demo', template = 'templates/template.docx' )
    
    # display all available styles with their names
    for( stylename in styles( doc ) )
      doc = addParagraph( doc, value = stylename, stylename = stylename)
    
    writeDoc( doc, file = 'examples/styles_demo.docx')

"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(), 
  src = "http://www.slideshare.net/slideshow/embed_code/37016310")

mkd = "

## Tables of contents and styles

Function addTOC has an optional argument stylename. If 
the argument is specified, a table of contents will be created 
with entries formatted with the style specified.

See [Tables of contents](./focus_toc.html)

"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )


source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)

doc = addBSMenu( doc, itemlink = "word_template.html", ddmenu = "Word")

writeDoc( doc, file = "word_template.html")
