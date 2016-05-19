# READ ME FIRST!!!!!!!!!!!!!!!!!!!!!!!!
############################################################
# CREATE A .DOCX FILE USING MICROSOFT WORD 2007 OR LATER
# WRITE ANY TEXT YOU LIKE, BUT WRITE THE TEXT TO BE REPLACED
# USING ${}. EXAMPLE, TO REPLACE THE WORD dog, USE ${dog}.
# THEN SAVE THE .DOCX FILE IN YOUR HOME DIRECTORY
# USING THE NAME: template1.docx.
# WINDOWS: C:/Users/[your username]/Documents
# Linux: /home/[your username]
# NOW YOU CAN EXECUTE THE SCRIPT BELOW
library(ReporteRs)

home <- Sys.getenv("HOME")

doc <- docx(template=paste0(home, '/template1.docx'))

# WILL REPLACE dog BY cat AND green BY red
doc <- replaceText(x=doc,
		c("dog", "green"),
		c("cat", "red"))

writeDoc(doc, paste0(home, '/Doc.docx'))