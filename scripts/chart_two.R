# Make chart that shows the max reported budget spent for each year
library("dplyr")
library("stringr")
library("ggplot2")
library("plotly")

options(scipen = 999)

#extract data
movie_df <- read.csv("../data/movies_metadata.csv", stringsAsFactors = FALSE)

#Convert budget column from character to numeric
movie_df$numeric_budget <- as.numeric(as.character(movie_df$budget))

#filter and create specific dataframe
budget_by_year <- movie_df %>%
  mutate(year = as.numeric(substring(release_date, 1, 4))) %>% 
  group_by(year) %>% 
  summarize(max_budget = max(numeric_budget, na.rm = TRUE)) %>%
  filter(max_budget != 0) %>% 
  filter(str_count(year) == 4)

#bar chart
p <- ggplot(budget_by_year) +
  geom_col(mapping = aes(x = year, y = max_budget, fill = (color_diff = max_budget))) +
  coord_flip() +
  theme(
    axis.ticks = element_blank(),       # remove axis ticks
    plot.background = element_blank(),  # remove gray background
    panel.border = element_blank()      # remove border around plot
  ) +
  scale_x_continuous(breaks=seq(1900,2020,5)) +
  scale_y_continuous(breaks=seq(0, max(budget_by_year$max_budget), 50000000)) +
  labs(title= "The Highest Budget Spend on Movie Production By Year",
        x ="Year", y = "($) Budget Dollars", fill = "($) Budget Dollars)")

#Make interactive plot
ggplotly(p, tooltip = c("year", "max_budget"))




  


