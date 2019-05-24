Genre <- read.csv("../data/movies.csv", stringsAsFactors = FALSE)
library("dplyr")
library("ggplot2")

most_common_genre <- Genre %>%
  group_by(genres) %>% 
  summarize(number_of_genre = n()) %>% 
  filter(genres !="(no genres listed)") %>% 
  arrange(-number_of_genre) %>% 
  top_n(10)

ggplot(data = most_common_genre) +
  geom_point(
    mapping = aes(x = number_of_genre, y = genres),
    color = "purple",
    alpha = .7,
    size = 6)
