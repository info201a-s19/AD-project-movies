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
    size = 6
  )

movie_df <- read.csv("../data/movies_metadata.csv", stringsAsFactors = FALSE)
# Does popularity equate to high revenue?

popularity_test <- movie_df %>% 
  filter(runtime != 0) %>% 
  filter(revenue != 0) %>% 
  select(runtime, revenue)

View(popularity_test)

ggplot(data = popularity_test) +
  geom_point(mapping = aes(x = runtime, y = popularity))

