data(mtcars)

plot( mtcars$mpg, mtcars$wt, type = "n", xlab = "mpg", ylab = "wt" )

dbl_click_actions = paste0("window.open('https://www.google.fr/#q=", 
  row.names( mtcars ),"');")

popup.labels = paste0( "<b>", row.names( mtcars ), "</b><br/>", 
  "<i>double click to google the car</i>")

add.plot.interactivity( fun = points, x = mtcars$mpg, y = mtcars$wt, 
  col = mtcars$gear, pch = 16, 
  dblclick.actions = dbl_click_actions, 
  popup.labels = popup.labels 
)

