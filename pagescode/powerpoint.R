library( ReporteRs );
library( ggplot2 )

options("ReporteRs-fontsize" = 11 )


doc = bsdoc( title = "Reporters - PowerPoint",
  description = "Reporters, PowerPoint Document",
  keywords = "ReporteRs, PowerPoint, pptx" )

mkd = "
`ReporteRs` lets you create PowerPoint document (`.pptx`).

It provides fine control of document design.
"
source(file = "pagescode/global/addBigText.R", local = TRUE)
doc = addBigText(doc, "Create PowerPoint documents from R", mkd )




default.par.properties = parProperties(text.align = "justify",
    padding.left = 0)

mkd = "
# Getting Started

## Create a pptx object

Use the function `pptx` to create an r object representing a PowerPoint document.
It takes two arguments: a title (appearing only in the document properties) and
a template file. If none is provided, the template file will be an empty document
located in the package directory.

When creating a pptx object, you use a template file. This file is copied in memory
and that copy becomes the document that will be completed with R outputs. Formats
and available slide layouts will be those available in the template file.

## Send R outputs into that object

Next, you create the components of your pptx file.

You must **add a slide before you are able to send R outputs** into that
document (into that slide...). Use the function `addSlide`. When adding a
slide, you have to choose which layout to use as design for your new slide.

You then add texts, tables, plots and other components into the slide
that has just been added.

> See *Adding content workflow* below.

## Write the object to a file

Finally, using `writeDoc`, you write the object into a file
with the suffix *.pptx* on your file system.

## Example

Below you can follow this process with a commented R script:
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

doc = addParagraph( doc, pot( "The following script is producing file ", format = textNormal() ) +
    pot( "pp_simple_example.pptx",
      textNormal(color = "#428bca", underlined = TRUE ),
      hyperlink = "./examples/pp_simple_example.pptx" ), par.properties = default.par.properties
)

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(),
  src = "http://www.slideshare.net/slideshow/embed_code/37205739")

source("rexamples/powerpoint_simple_example.R")
doc = addRScript( doc, file = "rexamples/powerpoint_simple_example.R" )

mkd = "
# Templates, layouts and styles

`pptx` will let you create documents based on a 'pptx' template file.

If none is provided, an empty document will be used (located into the package directory).
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "
    # use D:/docs/template/my_corporate_template.pptx as template
    doc = pptx(template = 'D:/docs/template/my_corporate_template.pptx')

    # use default template
    doc = pptx()
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "
`ReporteRs` use PowerPoint file as templates. A template is the original
PowerPoint document where all slides layouts, shapes (placeholders) and
styles come from:
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "
* Slide layouts are those available in the template.
* Designs and formating properties of layouts and shapes
(placeholders in a layout) are defined within the template.
* Content of the PowerPoint template is not deleted, which lets
you to easily add content into an existing presentation
without usual annoying copy-paste operations.
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "
> If these terms are unknown for you, I recommand you to read the following
to get a minimum of knownledge on layouts in PowerPoint:
[Create a new custom layout](http://office.microsoft.com/en-us/powerpoint-help/create-a-new-custom-layout-HA010079650.aspx) -
[Change a placeholder](http://office.microsoft.com/en-us/powerpoint-help/change-a-placeholder-HA010064940.aspx)

without usual annoying copy-paste operations.
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "
**If you need other layouts than those that come with PowerPoint's
built-in Slide Master** of your template, you can add a layout and
customize it for your PowerPoint presentation. To add your own layout,
just follow these steps in PowerPoint:
without usual annoying copy-paste operations.
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "
1. Switch to the Slide Master view
2. Insert Layout.
3. Insert the placeholders you want to add to the new layout.
Move and or resize them regarding to the content it should contains.
4. You can apply any formatting to new placeholders (i.e. change background color, font, etc.)
5. Save and close the template
6. Create a `pptx` object with function pptx using the argument `template` specifying the template filename.
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "
Read more about [template] (http://office.microsoft.com/en-gb/powerpoint-help/what-is-a-slide-layout-HA010338412.aspx).

# Adding content workflow

## Add a slide

Use the function `addSlide` to add a slide into the **pptx** object.
The number of available shapes that can be filled by R outputs is
conditionned by the chosen layout. For example, layout 'Title and Content'
can receive only one R output, 'Two Content' can receive two R output.

If you need a new layout, create it in PowerPoint.

When adding an R output, if no position nor size is specified, the R output will be
placed with position and dimensions of the available shape defined in the template
layout. See Force size and position if you prefer not to use your template properties
for shape positions.


## Send R outputs into the current slide

Next, you create the components of your slide.

You then add text, tables, plots and other components
into the slide that has just been added, available functions
are documented below. See *Functions list*.

If there is no room left in the current slide or you want to add another content,
you can force size and position of the shape.
See *Key functions and arguments/Force size and position*.



# Functions list

The following functions can only be used when the output format is pptx, which you create as described above.
"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

mkd <- "
* Add a title: [addTitle](./addTitle.html)
* Add a table: addFlexTable - see [FlexTable](./FlexTable.html)  and [addFlexTable](./addFlexTable.html)
* Add plots: see [addPlot](./addPlot.html)
* Add external images: see [addImage](./addImage.html)
* Add syntax highlighted R code: see [addRScript](./addRScript.html)
* Add paragraphs of text: see [addParagraph](./addParagraph.html)
* Add a slide: addSlide (see *Key functions and arguments*)
* Write the document into a file: [writeDoc](./writeDoc.html)
* Add a date: addDate (see *Specific functions*)
* Add a footer: addFooter (see *Specific functions*)
* Add a page number: addPageNumber (see *Specific functions*)
"

doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )


mkd = "

# Key functions and arguments

## Function addSlide

**If no slide has been added into the document object no content (tables,
plots, images, text) can be added.**

Funtion `addSlide`  let you add a slide in the pptx object.
Argument `slide.layout` let you specify which layout to use to design the new slide.

    doc = pptx()
    doc = addSlide( doc, slide.layout = 'Title and Content' )
    doc = addSlide( doc, slide.layout = 'Two Content' )

## Function slide.layouts

Available layouts are those contained in the template. Slide layout
concept is important in ReporteRs.

Content is conditioned by the chosen layout. When a slide is added
with layout 'Title and Content', this slide will only be able to
contain 2 contents: a title and a content theses are shapes.

Shapes (or placeholders) are where most of the formatting is done:
plot size is defined by shapes dimensions in the layout, default
fonts and paragraphs styles are those defined by the shape properties, etc.

`slide.layouts` returns slide layouts names. When adding a slide with `addSlide`
you may need that function to ckeck available names.

    doc = pptx()
    slide.layouts(doc)

**Check slide layout**

use optional argument `layout` with function `slide.layouts` to get
a plot of the design of your layout.

    slide.layouts(doc, 'Comparison')

"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

options("ReporteRs-fontsize" = 11 )
xx=pptx()
xx = addSlide( xx, slide.layout = "Comparison")
doc = addPlot( doc, fun = function() {slide.layouts(xx,layout = 'Comparison' )} )

mkd = "

Here, the slide can receive the following shapes: a title, 4 contents
(plots, tables, paragraphs), a date and a slide number.

## Force size and position

Width, height and positions of the output (i.e. shape size and position)
are defined by the properties of the shape defined in the layout of the
PowerPoint template used.

**When adding content, ReporteRs read the properties of the next available
shape in the current slide.**

**You can explicitly specify shape position and dimensions for some specific
outputs: tables, text, plots and external images.**.

If arguments `offx`, `offy`, `width`, `height` are missing, position
and dimensions are defined by the width and height of the next available shape of the slide.

If these arguments are specified, they become position and dimensions of the
new shape. It let you also to add content on a slide if no more shape is available.

"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )


doc = addParagraph( doc, pot( "The following script is producing file ", format = textNormal() ) +
    pot( "pp_force_pos.pptx",
      textNormal(color = "#428bca", underlined = TRUE ),
      hyperlink = "./examples/pp_force_pos.pptx" ), par.properties = default.par.properties
)

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(),
  src = "http://www.slideshare.net/slideshow/embed_code/37153814")

source("rexamples/pp_force_pos.R")
options("ReporteRs-fontsize" = 11 )

doc = addRScript( doc, file = "rexamples/pp_force_pos.R" )


mkd = "
# Specific functions

## Date

Function `addDate` lets you adding a date in the current slide.
The shape will be positioned with the date shape properties of the template document.

    doc = pptx()
    doc = addSlide( doc, slide.layout = 'Title and Content' )
    doc = addDate( doc )
    doc = addSlide( doc, slide.layout = 'Title and Content' )
    doc = addDate( doc, 'Dummy date' )

## Page number

Function `addPageNumber` lets you adding slide number in the current slide. The
shape will be positioned with the page number shape properties of the template document.

    doc = pptx()
    doc = addSlide( doc, slide.layout = 'Title and Content' )
    doc = addPageNumber( doc )
    doc = addSlide( doc, slide.layout = 'Title and Content' )
    doc = addPageNumber( doc, 'Dummy text' )

## Footer

Function `addFooter` lets you adding a comment in the footer of current slide.
The shape will be positioned with the footer shape properties of the template
document.

    doc = pptx()
    doc = addSlide( doc, slide.layout = 'Title and Content' )
    doc = addFooter( doc, 'Dummy text' )

## Subtitle

Function `addSubtitle` lets you adding a subtitle in the current slide. The
shape will be positioned with the subtitle shape properties of the template document.

Subtitle shape only exist in slide of type 'Title Slide'.

    doc = pptx()
    doc = addSlide( doc, slide.layout = 'Title Slide' )
    doc = addTitle( doc, 'Presentation title' )
    doc = addSubtitle( doc , 'This document is generated with ReporteRs.')

# Replace slide

To replace an existing slide by a new one, use `addSlide` with
optional argument bookmark. Bookmark is the index of the slide
that has to be replaced with a new empty one.

"

doc = addMarkdown( doc, text = mkd, default.par.properties = default.par.properties )

doc = addParagraph( doc, pot( "The following script is producing file ", format = textNormal() ) +
    pot( "pp_replacement.pptx",
      textNormal(color = "#428bca", underlined = TRUE ),
      hyperlink = "./examples/pp_replacement.pptx" ), par.properties = default.par.properties
)

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(),
  src = "http://www.slideshare.net/slideshow/embed_code/37154324")

source("rexamples/pp_replacement.R")
options("ReporteRs-fontsize" = 11 )

doc = addRScript( doc, file = "rexamples/pp_replacement.R" )


mkd = "# Complete example

You will find below a script that shows usage of most usefull functions
available for pptx objects.
"
doc = addMarkdown( doc, text = mkd,
  default.par.properties = default.par.properties )

source("rexamples/pp_long_demo.R")
options("ReporteRs-fontsize" = 11 )

doc = addParagraph( doc, pot( "The following script is producing file ", format = textNormal() ) +
    pot( "pp_long_demo.pptx",
      textNormal(color = "#428bca", underlined = TRUE ),
      hyperlink = "./examples/pp_long_demo.pptx" ), par.properties = default.par.properties
)

doc = addIframe( doc, width = 600, height = 500, par.properties = parCenter(),
  src = "http://www.slideshare.net/slideshow/embed_code/37205867")

doc = addRScript( doc, file = "rexamples/pp_long_demo.R" )



source(file = "pagescode/global/addFooter.R", local = TRUE)
source(file = "pagescode/global/menu.R", local = TRUE)
source(file = "pagescode/global/google_code.R", local = TRUE)
doc = addBSMenu( doc, itemlink = "powerpoint.html", ddmenu = "")

writeDoc( doc, file = "powerpoint.html")
