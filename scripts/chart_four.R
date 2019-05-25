library("dplyr")
library("ggplot2")
options(scipen = 999)

movie_df <- read.csv("../data/movies_metadata.csv", stringsAsFactors = FALSE)
# Does high run-times of movies equate to high revenue?


test <- movie_df %>% 
  filter(runtime != 0) %>% 
  filter(revenue != 0) %>% 
  select(runtime, revenue)

ggplot(data = test) +
  geom_point(mapping = aes(x = runtime, y = revenue), alpha = (1/10)) +
  scale_x_continuous(breaks=seq(1900,2020,5)) +
  scale_y_continuous(breaks=seq(0, max(test$revenue), 500000000)) +
  labs(title= "Scatter Plot of Correlation Between Movie Run Time and Revenue",
       x ="Movie Run Time (minutes)", y = "($) Revenue")