movie_df <- read.csv("../data/movies_metadata.csv", stringsAsFactors = FALSE)
library("dplyr") # Loads dplyr
library("tidyr") # Loads tidyr
library("ggplot2") # Loads ggplot2

# What are the top 25 movie titles in terms of revenue?
summary_top_25 <- movie_df %>%
  group_by(title) %>% 
  summarise(revenue = sum(revenue), na.rm = TRUE) %>%
  top_n(25, wt = revenue) %>% 
  pull(title)

# What are the revenue of the top 25 movie titles?
summary_rev <- movie_df %>%
  group_by(title) %>%
  summarise(revenue = sum(revenue), na.rm = TRUE) %>%
  top_n(25, wt = revenue) %>% 
  pull(revenue)



