docx.doc = docx()

styles( docx.doc )

docx.doc = declareTitlesStyles(docx.doc
  , stylenames = c("Titre1", "Titre2", "Titre3"
    , "Titre4", "Titre5", "Titre6"
    , "Titre7", "Titre8", "Titre9" ) )

docx.doc = addTitle( docx.doc, "title 1", 1 )

docx.doc = addTitle( docx.doc, "title 2", 2 )

docx.doc = addTitle( docx.doc, "title 3", 3 )

docx.doc = addTitle( docx.doc, "title 4", 4 )

writeDoc( docx.doc, file = "examples/declare_titles_styles.docx")
