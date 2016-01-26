library( ReporteRs );
library( ggplot2 )

options("ReporteRs-fontsize" = 11 )


doc = bsdoc( title = "Reporters - Word", 
  description = "Reporters, Word Document", 
  keywords = "ReporteRs, Word, docx" )


mkd = "
`ReporteRs` lets you create Word document (`.docx`). 

It provides fine control of document design.
"

source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Create Word documents from R", mkd )



default.par.properties = parProperties(text.align = "justify", 
    padding.left = 0)

mkd = "
# Getting Started

## Create a docx object
    
Use the function `docx` to create an r object representing a Word document. 
It takes two arguments: a title (appearing only in the Word document properties) 
and a **template file**. If none is provided, the template file will be an empty 
document located in the package directory.

When creating a docx object, you use a template file. This file is copied 
in memory and that copy becomes the document that will be completed with R outputs. 
Formats and available styles will be (mainly) those available in the template file.

## Send R outputs into that object

Next, you create the components of your docx file. You create 
and format text, then insert it using the addParagraph function. 
You create and insert tables, perhaps merging cells, changing 
row and column colors or fonts. And, of course, you add plots. 
Tables, plots and paragraphs formats can be customised with 
dedicated functions.

## Write the object to a file

Finally, using `writeDoc`, you write the object into a file 
with the suffix *.docx* on your file system.

## Example
Below you can follow this process with a commented R script:
"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

source("rexamples/word_simple_example.R")
doc = addRScript( doc, file = "rexamples/word_simple_example.R" )

doc = addParagraph( doc, pot( "The following script is producing file ", format = textNormal() ) + 
    pot( "word_simple_example.docx", 
      textNormal(color = "#428bca", underlined = TRUE ), 
      hyperlink = "./examples/word_simple_example.docx" ), par.properties = default.par.properties
)

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(), 
  src = "http://www.slideshare.net/slideshow/embed_code/37019178")

mkd = "
# Function list

The following functions can only be used when the output format is docx, which you create as described above.

* Get available styles from the template: styles (see Styles below)
* Add a title: [addTitle](./addTitle.html)
* Add a table: addFlexTable - see [FlexTable](./FlexTable.html)  and [addFlexTable](./addFlexTable.html)
* Add plots: addPlot (see [addPlot](./addPlot.html) and [Editable Vector Graphics](./evg.html) )
* Add external images: addImage (see [External images](./addImage.html) )
* add section (i.e for landscape, columns): [addSection](#addSection)
* Add syntax highlighted R code: [addRScript](./addRScript.html)
* Add paragraphs of text: [addParagraph](./addParagraph.html)
* Add markdown: [addMarkdown](./markdown.html)
* Add a table of contents: addTOC (see Specific functions/Table of contents )
* Add a page break: addPageBreak (see Specific functions/Page breaks )
* Delete a content located after a bookmark: deleteBookmarkNextContent (see Specific functions/Delete content )
* Write the document into a file: [writeDoc](./writeDoc.html)
* Create a `Footnote` to add into a [pot](./pot_objects.html) object. 

# Templates

You may need to generate docx documents in a particular corporate template 
(with specific fonts, colour schemes, logos, etc.).

`docx` let you create documents that draw on such a corporate template 
based on a Word 'docx' template file.

If you don't direct ReporteRs to a template file, an empty document 
will be used (located into the package directory) and you will have a document 
with its Word styles.

    # use D:/docs/template/my_corporate_template.docx as template
    doc = docx(template = 'D:/docs/template/my_corporate_template.docx')
    
    # use default template
    doc = docx()
"
doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

doc = addParagraph( doc, value = pot( "Read more about template", hyperlink = "./word_template.html",
  format = textBold(font.size = 18, underline = TRUE, color = "#428BCA") ), 
  par.properties = parCenter( padding = 6 ) )

mkd = "# Styles 

Available styles will be paragraph styles of the base document 
(e.g. Normal, Title1, etc.). Names of the returned character vector 
are internal Word labels associated with styles names.

    doc = docx()
    styles( doc )
"


doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

doc = addRScript( doc, 
  text = paste0( "#", capture.output( {xx=docx();styles(xx)}) , collapse = "\n" ) 
 )

mkd = "
# Replace content

You can replace Word bookmarks by tables, paragraphs and plots.

Work bookmarks can be used to define a named location in your document. 
Read MS documentation about bookmark [here](http://www.wikihow.com/Add-a-Bookmark-in-Microsoft-Word).

Functions **addFlexTable, addPlot, addParagraph and addImage** 
can send respective outputs into theses bookmarks.

These functions have an optional argument `bookmark`. 
If the argument is used, content (plots, paragraphs or images) 
will **replace the whole paragraph containing the bookmark**.

----- 

> Behavior is ifferent for tables: **tables are added 
> AFTER** the paragraph that contains the bookmark.

> A Word table is an object you can add to your document. Paragraphs 
> and tables are different containers ; a Word table contains paragraphs 
> but is not a paragraph object. Because Word bookmarks are located in 
> paragraphs, it is not possible to bookmark a table. 

----- 
"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

mkd = "> If a table contains a bookmark used to add another 
table (therefore creating a **nested table**), the table 
header won't be repeated if the cell is displayed on 
several pages. ReporteRs expects a bookmark to be in a 
single paragraph to be used with `addFlexTable`. However, 
Word is not able to repeat header cells if table is nested 
in another table.

-----"

doc = addMarkdown( doc, text = mkd, 
  text.properties = textProperties(color = "#a94442"),
  default.par.properties = default.par.properties )

mkd = "

## Example

We will use the following file as template: [word_bookmark_template.docx](templates/word_bookmark_template.docx)

The script is producing the following file: [word_replacement.docx](examples/word_replacement.docx)

"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

source( file = "rexamples/word_replacement.R" )
doc = addRScript( doc, file = "rexamples/word_replacement.R" )

mkd = "
## Declare bookmark in Word

To add a bookmark that ReporteRs will use later, you have to add 
the bookmark **on a portion of a text in a paragraph**. No matter what 
the selected text is, ReporteRs will replace the whole paragraph. 

To make it work properly, **do not add the bookmark on the whole paragraph** 
but rather in the paragraph (e.g. select the first word of the paragraph 
and bookmark it).

This operation is to be done in Word, by editing the template of the document.

"

doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

mkd = "Below an example that will not work (bookmark brackets are 
on the whole paragraph):"

doc = addMarkdown( doc, text = mkd, 
  text.properties = textProperties(color = "#a94442"),
  default.par.properties = default.par.properties )

doc = ReporteRs::addImage( doc, filename = "./figure/bookmark_wrong.png", width = 8.65, height = 1.9)
mkd = "Below an example that will work (bookmark brackets are 
not on the whole paragraph):"

doc = addMarkdown( doc, text = mkd, 
  text.properties = textBold(color = "#2f6f9f"),
  default.par.properties = default.par.properties )

doc = ReporteRs::addImage( doc, filename = "./figure/bookmark_right.png", width = 8.58, height = 1.61)


mkd = "# Specific functions

## Table of contents

Insert a table of contents with function `addTOC`.

    doc = addTOC(doc)

Insert a customized table of contents with the argument `stylename`. If 
used, a table of contents will be created containing entries formatted 
with specified styles.

Read more about tables of contents.

## Page breaks

Insert a page break with function addPageBreak

    doc = addPageBreak(doc)

## Delete content

Function `deleteBookmarkNextContent` deletes the content just after a bookmark.

It has to be used when 'refreshing' a table in a docx file.

AddFlexTable uses `bookmark` as the **location preceding** 
the destination of the `FlexTable`.

If a document's table of content needs to be updated, it has to be done in two steps:

1. suppress the previously added table with **deleteBookmarkNextContent**
2. insert new table with **AddFlexTable**.
"


doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

doc = addTitle( doc, value = "Section", level = 2, id = "addSection" )

mkd = "

Function `addSection` lets you add a section and change document orientation
and split new content along 2 or more columns.

The function requires you to add a section before and after the item(s) that 
you want to be on a landscape and/or multicolumns mode page. 

    doc = addSection( doc, landscape = TRUE)
    doc = addParagraph( doc, \"My text\", stylename = \"Normal\" )
    doc = addSection( doc )

    doc = addSection( doc, ncol = 2, landscape = TRUE)
    doc = addParagraph( doc, \"My text on column 1\", stylename = \"Normal\" )
    doc = addColumnBreak(doc )
    doc = addParagraph( doc, \"My text on column 2\", stylename = \"Normal\" )
    doc = addSection( doc )

"
doc = addMarkdown( doc, text = mkd, 
  default.par.properties = default.par.properties )

source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "word.html", ddmenu = "Word")

writeDoc( doc, file = "word.html")
