# mymenu = BootstrapMenu( title = "ReporteRs", link = "./index.html", text.color = "#eeeeee",
#   bg.color = "black", text.emphasis.color = "white", 
#   bg.active.color = "#333333"
#   )
# mymenu = BootstrapMenu( title = "ReporteRs", link = "./index.html", text.color = "#eeeeee",
#   bg.color = "#024772", text.emphasis.color = "white", 
#   bg.active.color = "#02658C"
#   )
# mymenu = BootstrapMenu( title = "ReporteRs", link = "./index.html", text.color = "#eeeeee",
#   bg.color = "#AD0000", text.emphasis.color = "white", 
#   bg.active.color = "#D11702"
#   )

addBSMenu = function( doc, itemlink = "", ddmenu = ""){

	mymenu = BootstrapMenu( title = "ReporteRs", link = "./index.html" )
#   mymenu = BootstrapMenu( title = "ReporteRs", link = "./index.html", text.color = "#024772",
#   bg.color = "#024772", text.emphasis.color = "#02658C",  
#   bg.active.color = "#02658C"
#   )
	mymenu = addLinkItem( mymenu, label = "Getting Started", "gettingstarted.html")

	mydd = DropDownMenu( label = "Formatting content" )
	mydd = addLinkItem( mydd, label = "formatting Properties", "formatting_properties.html", separator.after = TRUE, active = (itemlink == "formatting_properties.html") )
	mydd = addLinkItem( mydd, label = "FlexTable objects", "FlexTable.html", active = (itemlink == "FlexTable.html") )
	mydd = addLinkItem( mydd, label = "FlexTable examples", "flextable_examples.html", separator.after = TRUE, active = (itemlink == "flextable_examples.html") )
	mydd = addLinkItem( mydd, label = "pot objects", "pot_objects.html", active = (itemlink == "pot_objects.html") )
	mydd = addLinkItem( mydd, label = "Lists", "lists.html", separator.after = TRUE, active = (itemlink == "lists.html") )
	mydd = addLinkItem( mydd, label = "Markdown", "markdown.html", separator.after = TRUE, active = (itemlink == "markdown.html") )
	mydd = addLinkItem( mydd, label = "Editable vector graphics", "evg.html", active = (itemlink == "evg.html") )
	mymenu = addLinkItem( mymenu, dd = mydd, active = ( ddmenu == "Formatting content" ) )

	mydd = DropDownMenu( label = "Word" )
	mydd = addLinkItem( mydd, label = "Word", "word.html", separator.after = TRUE, active = (itemlink == "word.html") )
	mydd = addLinkItem( mydd, label = "Tables of contents", "./focus_toc.html", active = (itemlink == "focus_toc.html") )
	mydd = addLinkItem( mydd, label = "Templates", "./word_template.html", active = (itemlink == "word_template.html") )
	mymenu = addLinkItem( mymenu, dd = mydd, active = ( ddmenu == "Word" ) )

	mymenu = addLinkItem( mymenu, label = "PowerPoint", "powerpoint.html")


	mydd = DropDownMenu( label = "HTML" )
	mydd = addLinkItem( mydd, label = "Bootstrap documents", "bsdoc.html", active = (itemlink == "formatting_properties.html") )
	mydd = addLinkItem( mydd, label = "Get HTML chunks", "./html_chunks.html", active = (itemlink == "formatting_properties.html") )
	mymenu = addLinkItem( mymenu, dd = mydd, active = ( ddmenu == "HTML" ) )


	mydd = DropDownMenu( label = "Main functions" )
	mydd = addLinkItem( mydd, label = "addFlexTable", "addFlexTable.html", active = (itemlink == "addFlexTable.html") )
	mydd = addLinkItem( mydd, label = "addPlot", "addPlot.html", active = (itemlink == "addPlot.html") )
	mydd = addLinkItem( mydd, label = "addParagraph", "addParagraph.html", active = (itemlink == "addParagraph.html") )
	mydd = addLinkItem( mydd, label = "addImage", "addImage.html", active = (itemlink == "addImage.html") )
	mydd = addLinkItem( mydd, label = "addTitle", "addTitle.html", active = (itemlink == "addTitle.html") )
	mydd = addLinkItem( mydd, label = "addRScript", "addRScript.html", active = (itemlink == "addRScript.html") )
	mydd = addLinkItem( mydd, label = "writeDoc", "writeDoc.html", active = (itemlink == "writeDoc.html") )

	mymenu = addLinkItem( mymenu, dd = mydd, active = ( ddmenu == "Main functions" ) )

	doc = addBootstrapMenu( doc, mymenu )
  doc = addTOC( doc )
	doc
}

