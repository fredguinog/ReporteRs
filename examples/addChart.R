# READ ME FIRST!!!!!!!!!!!!!!!!!!!!!!!!
############################################################
# CREATE A .DOCX FILE USING MICROSOFT WORD 2007 OR LATER
# INSERT A BARCHAT OR LINECHART USING THE MENU "INSERT".
# CLICK "CHART" BUTTON IN THE RIBBON "ILLUSTRATIONS",
# WHEN THE EXCEL WORKBOOK OPENS, YOU JUST NEED TO CLOSE IT.
# THEN SELECT THE LINE WHERE THE CHART IS (THE CHART WILL BE
# IN A SHADOW) AND ADD A BOOKMARK, SELECTING MENU "INSERT"
# CLICK "BOOKMARK" BUTTON IN THE RIBBON "ILLUSTRATIONS".
# INSERT A BOOKMARK WITH THE NAME "CHART1".
# TIP: SEARCH USING GOOGLE HOW TO MAKE BOOKMARKS VISIBLE.
# NOW YOU CAN CUSTOMIZE THE CHART LOOK AND FEEL ANYWAY
# YOU LIKE. THEN SAVE THE .DOCX FILE IN YOUR HOME DIRECTORY
# USING THE NAME: template1.docx.
# WINDOWS: C:/Users/[your username]/Documents
# Linux: /home/[your username]
# NOW YOU CAN EXECUTE THE SCRIPT BELOW
#
# NOW CREATE A SECOND EMPTY .DOCX FILE, empty.docx, AND ALSO
# SAVE TO YOUR HOME DIRECTORY.
#
library(ReporteRs)

home <- Sys.getenv("HOME")

doc1 <- docx(template=paste0(home, '/template1.docx'))
doc1ChartXML = chart_extractXML( doc1, bookmark = "CHART1" )

df <- data.frame(
  Year=c('2015','','','','2016',''),
  Trim=c('T1','T2','T3', 'T4', 'T1', 'T2'),
  Indicator1=c(4,2,8,3,6,8),
  Indicator2=c(9,1,3,2,7,9),
  Indicator3=c(1,4,1,5,6,2),
  Indicator4=c(9,7,8,5,3,2)
)

emptydoc <- docx(template=paste0(home, '/empty.docx'))

doc2 <- addChart( x = emptydoc, XML = doc1ChartXML, newData = df, ncolxaxis = 2L, width = 6L, height = 4L )

# IT IS ALSO POSSIBLE TO CREATE A BOOKMARK INSIDE empty.docx AND PASS IT TO THE FUNCTION addChart, SHOWN BELOW
# THE BOOKMARK WILL BE REPLACED BY A CHART
#doc2 <- addChart( x = emptydoc, XML = doc1ChartXML, newData = df, ncolxaxis = 2L, width = 6L, height = 4L, bookmark = "xxxx" )

writeDoc(doc2, paste0(home, '/Doc2.docm'))

# NOW OPEN THE Doc2.docm FILE. WHEN THE SECURITY WARNING "MACROS
# HAVE BEEN DISABLED." SHOWS UP, PUSH THE BUTTON "ENABLE CONTENT".
# CHART INITIALLY BLANK WILL BE FILLED WITH THE NEW DATA, AFTER THE
# MACRO THAT RECREATES THE CACHE OF ALL CHARTS IN THE DOCUMENT IS
# EXECUTED. IF YOU LIKE, YOU CAN NOW SAVE THE FILE AS .DOCX AND
# ELIMINATE THE UNNECESSARY MACRO.