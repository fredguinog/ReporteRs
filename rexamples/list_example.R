library( ReporteRs )

# define parProperties with list properties
ordered.list.level1 = parProperties(list.style = "ordered", level = 1 )
ordered.list.level2 = parProperties(list.style = "ordered", level = 2 )

# define parProperties with list properties
unordered.list.level1 = parProperties(list.style = "unordered", level = 1 )
unordered.list.level2 = parProperties(list.style = "unordered", level = 2 )

mydoc = docx( )

text1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
text2 = "In sit amet ipsum tellus. Vivamus dignissim arcu sit amet faucibus auctor."
text3 = "Quisque dictum tristique ligula."


mydoc = addTitle( mydoc, "Ordered list", level = 1 )
# add ordered list items 
mydoc = addParagraph( mydoc, value = text1, 
	par.properties = ordered.list.level1 )
mydoc = addParagraph( mydoc, value = text2, 
  par.properties = ordered.list.level2 )
mydoc = addParagraph( mydoc, value = text2, 
  par.properties = ordered.list.level2 )

# add ordered list items without restart renumbering
mydoc = addParagraph( mydoc, value = c( text1, text2, text3), 
	par.properties = ordered.list.level1 )

# add ordered list items and restart renumbering
mydoc = addParagraph( mydoc, value = c( text1, text2, text3), restart.numbering = TRUE, 
		par.properties = ordered.list.level1 )

mydoc = addTitle( mydoc, "Unordered list", level = 1 )

mydoc = addParagraph( mydoc, value = text1, 
		par.properties = unordered.list.level1 )
mydoc = addParagraph( mydoc, value = text2, 
		par.properties = unordered.list.level2 )


# Write the object
writeDoc( mydoc, file = "examples/lists.docx")
