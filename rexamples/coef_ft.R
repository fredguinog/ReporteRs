data(mtcars)
mtcars$cyl = as.factor(mtcars$cyl)
data = summary(lm(mpg ~ wt + cyl, data=mtcars))$coefficients

data = as.data.frame( data )


# get signif codes
signif.codes = cut( data[,4]
  , breaks = c( -Inf, 0.001, 0.01, 0.05, Inf)
  , labels= c("***", "**", "*", "" ) )

# format the data values
data[, 1] = formatC( data[, 1], digits=3, format = "f")
data[, 2] = formatC( data[, 2], digits=3, format = "f")
data[, 3] = formatC( data[, 3], digits=3, format = "f")
data[, 4] = ifelse( data[, 4] < 0.001, "< 0.001", formatC( data[, 4], digits=5, format = "f"))
# add signif codes to data
data$Signif = signif.codes

# create an empty FlexTable
coef_ft = FlexTable( data = data, add.rownames=TRUE
  , body.par.props = parRight(), header.text.props = textBold() 
  , header.columns = T
)
# center the first column and set text as bold italic
coef_ft[,1] = parCenter()
coef_ft[,1] = textBoldItalic()

# define borders
coef_ft = setFlexTableBorders( coef_ft
  , inner.vertical = borderNone(), inner.horizontal = borderDotted()
  , outer.vertical = borderNone(), outer.horizontal = borderSolid()
)
