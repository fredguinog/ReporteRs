library( boot )
library( dplyr )

data(melanoma)

melanoma$Status = c( 'Melanoma', 'Alive' , 'Non-melanoma' )[melanoma$status]
melanoma$Gender = ifelse( melanoma$sex > 0, 'Male', 'Female' )
melanoma$Ulceration = ifelse( melanoma$ulcer > 0, 'Present', 'Absent' )

data = melanoma %>% group_by( Status, Ulceration ) %>% summarize( n = n(),
  Mean = round( mean( thickness, na.rm = T ), 3 ), 
  SD = round( sd( thickness, na.rm = T ), 3 ), 
  Median = median( thickness, na.rm = T ), 
  Min = min( thickness, na.rm = T ), 
  Max = max( thickness, na.rm = T ), 
  Missing = sum( is.na( thickness ) )
  )

data = as.data.frame( data )
