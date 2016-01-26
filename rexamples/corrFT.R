data( mtcars )
cormatrix = cor(mtcars)

pal = c( "#D73027", "#F46D43", "#FDAE61", "#FEE08B", 
  "#D9EF8B", "#A6D96A", "#66BD63", "#1A9850" )
mycut = cut( cormatrix, 
	breaks = c(-1,-0.75,-0.5,-0.25,0,0.25,0.5,0.75,1),
	include.lowest = TRUE, label = FALSE )
mycolors = pal[ mycut ]

corrFT = FlexTable( round(cormatrix, 3), add.rownames = TRUE )

# set computed colors
corrFT = setFlexTableBackgroundColors( corrFT, 
	j = seq_len(ncol(cormatrix)) + 1, 
	colors = mycolors )

# cosmetics
corrFT = setFlexTableBackgroundColors( corrFT, i = 1, 
	colors = "gray", to = "header" )
corrFT[1, , to = "header"] = textBold(color="white")

corrFT = setFlexTableBackgroundColors( corrFT, j = 1, colors = "gray" )
corrFT[,1] = textBold(color="white")

corrFT = setFlexTableBorders( corrFT
	, inner.vertical = borderProperties( style = "dashed", color = "white" )
	, inner.horizontal = borderProperties( style = "dashed", color = "white"  )
	, outer.vertical = borderProperties( width = 2, color = "white"  )
	, outer.horizontal = borderProperties( width = 2, color = "white"  )
)
