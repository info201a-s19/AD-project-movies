# Make chart that shows the max reported budget spent for each year
library("dplyr")
library("stringr")
library("ggplot2")
library("plotly")

options(scipen = 999)

#extract data



#Convert budget column from character to numeric

#filter and create specific dataframe
budget_by_year <- function(df) {
  df$numeric_budget <- as.numeric(as.character(df$budget))
  df %>%
  mutate(year = as.numeric(substring(release_date, 1, 4))) %>% 
  group_by(year) %>% 
  summarize(max_budget = max(numeric_budget, na.rm = TRUE)) %>%
  filter(max_budget != 0) %>% 
  filter(str_count(year) == 4) 
}







  


