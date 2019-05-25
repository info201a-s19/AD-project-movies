library("dplyr")
library("ggplot2")
options(scipen = 999)

# Does high run-times of movies equate to high revenue?
correlation <- function(df) {
  run_vs_rev <- df %>%
    filter(runtime != 0) %>%
    filter(revenue != 0) %>%
    select(runtime, revenue)

  scatterplot <- ggplot(data = run_vs_rev) +
    geom_point(mapping = aes(x = runtime, y = revenue), alpha = (1 / 10)) +
    scale_x_continuous(breaks = seq(0, max(run_vs_rev$runtime), 20)) +
    scale_y_continuous(breaks = seq(0, max(run_vs_rev$revenue), 500000000)) +
    labs(
      title = "Scatter Plot of Movie Run Time and Revenue",
      x = "Run Time in Minutes", y = "($) Revenue"
    )
  return(scatterplot)
}
