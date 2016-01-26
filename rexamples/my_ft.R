# a summary of mtcars
dataset = aggregate( mtcars[, c("disp", "mpg", "wt")]
  , by = mtcars[, c("cyl", "gear", "carb")]
  , FUN = mean )

dataset = dataset[ order(dataset$cyl, dataset$gear, dataset$carb), ]

# set cell padding defaut to 2
baseCellProp = cellProperties( padding = 2 )

# Create a FlexTable with data.frame dataset
my_ft = FlexTable( data = dataset
  , body.cell.props = baseCellProp
	, header.cell.props = baseCellProp
	, header.par.props = parProperties(text.align = "center" )
)

# set columns widths (in inches)
my_ft = setFlexTableWidths( my_ft, widths = c(0.5, 0.5, 0.5, 0.7, 0.7, 0.7) )

# span successive identical cells within column 1
my_ft = spanFlexTableRows( my_ft, j = 1, runs = as.character( dataset$cyl ) )

# overwrites some text formatting properties
my_ft[dataset$wt < 3, 6] = textProperties( color="#FF3333", font.weight = "bold" )
my_ft[dataset$mpg < 20, 5] = chprop( baseCellProp, background.color = "#00AAAA")

# overwrites some paragraph formatting properties
my_ft[, 4:6] = parProperties(text.align = "right")

# applies a border grid on table
my_ft = setFlexTableBorders( my_ft
	, outer.vertical = borderProperties( width = 2 )
	, outer.horizontal = borderProperties( width = 2 )
)
