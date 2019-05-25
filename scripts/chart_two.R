# Make chart that shows the max reported budget spent for each year
library("dplyr")
library("stringr")
library("ggplot2")
options(scipen = 999)


budget_by_year <- function(df) {
  # Filter and create specific dataframe
  df$numeric_budget <- as.numeric(as.character(df$budget))
  budget_df <- df %>%
    mutate(year = as.numeric(substring(release_date, 1, 4))) %>%
    group_by(year) %>%
    summarize(max_budget = max(numeric_budget, na.rm = TRUE)) %>%
    filter(max_budget != 0) %>%
    filter(str_count(year) == 4)

  # GGPlot Generation
  bar_chart <- ggplot(budget_df) +
    geom_col(mapping = aes(x = year, y = max_budget,
                           fill = (color_diff <- max_budget))) +
    coord_flip() +
    theme(
      axis.ticks = element_blank(),
      plot.background = element_blank(),
      panel.border = element_blank()
    ) +
    scale_x_continuous(breaks = seq(1900, 2020, 5)) +
    scale_y_continuous(breaks = seq(0, max(budget_df$max_budget), 100000000)) +
    labs(
      title = "The Highest Budget Spend on Movie Production By Year",
      x = "Year", y = "($) Budget Dollars", fill = "($) Budget Dollars)"
    )
  return(bar_chart)
}
