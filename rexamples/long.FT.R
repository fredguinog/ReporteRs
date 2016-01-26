library( dplyr )
library( reshape2 )

source( "data/long.data.R") 

mydata = long.data %>% group_by( SUBJ, TREATMENT, DAY_INT ) %>% 
  summarise( conc = median( A.CONC, na.rm = T ) )
mydata$SUBJ = paste0("Subject ", mydata$SUBJ )

mydata = dcast( mydata, formula = SUBJ + TREATMENT ~ DAY_INT, value.var = "conc"  )

# new FlexTable with mydata data in the table body
longFT = FlexTable( mydata, header.columns = F, body.par.props = parRight(), header.par.props = parRight() )

MyFTable = spanFlexTableRows( longFT, j = 1, 
  runs = as.character( mydata$SUBJ ) )

# add headers 
longFT = addHeaderRow( longFT, 
  value = c("", "Days"), 
  colspan = c( 2, 9) 
)
longFT = addHeaderRow( longFT, 
  value = c("Subject", "Treatment", paste0( "Day ", names(mydata)[-c(1,2)])) )

# add Footers
.mean = apply( mydata[, -c(1,2)], 2, mean, na.rm = T )
.sd = apply( mydata[, -c(1,2)], 2, sd, na.rm = T )
.med = apply( mydata[, -c(1,2)], 2, median, na.rm = T )

longFT = addFooterRow( longFT, value = c("", "Mean: ",sprintf("%.1f", .mean) ) )
longFT = addFooterRow( longFT, value = c("", "SD: ",sprintf("%.1f", .sd) ) )
longFT = addFooterRow( longFT, value = c("", "Median: ",sprintf("%.1f", .med) ) )

# set columns widths
longFT = setFlexTableWidths( longFT, widths = c( 1.5, 2, rep(0.75, 9) ) )

# manage borders
longFT = setFlexTableBorders( longFT, footer = T,
  , inner.vertical = borderSolid(  )
  , inner.horizontal = borderDashed( )
  , outer.vertical = borderSolid(width=2)
  , outer.horizontal = borderSolid(width=2)
)

# now work a little more on borders and other details
longFT[, 4:11, side = "left"] = borderNone( )

longFT[1, 3, side = "left", to = "header"] = borderSolid( )
longFT[1,, to = "header"] = parCenter( )
longFT[, 4:11, side = "left", to = "header"] = borderNone( )

longFT[, c(2, 4:11), side = "left", to = "footer"] = borderNone( )
longFT[1:2, , side = "bottom", to = "footer"] = borderNone( )
longFT[, , to = "footer"] = textNormal()
