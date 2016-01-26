dataset <- mtcars
dataset$tooltip <- row.names(mtcars)

if( require(ggiraph) ){
  gg_point_1 <- ggplot(dataset,
         aes(x = disp, y = wt, color = mpg, tooltip = tooltip ) ) +
    geom_point_interactive()

  print( gg_point_1 )
}
