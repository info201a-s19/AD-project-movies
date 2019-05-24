movie_metadata <- read.csv("../data/movies_metadata.csv", stringsAsFactors = FALSE)

library("dplyr") # Loads dplyr
library("tidyr") # Loads tidyr
library("ggplot2") # Loads ggplot2

# What are the top 10 most voted movies?
top_10 <- function(df) {
  df %>% 
  group_by(title) %>%
  summarise(vote_count = sum(vote_count), na.rm = TRUE) %>%
  top_n(10, wt = vote_count) %>%
  arrange(vote_count) %>%
  mutate(title = factor(title, title))
}

test <- top_10(movie_metadata)

# # Creates a bar chart with labels to indicate the top 10 most voted movies.
ggplot(test) +
  geom_col(mapping = aes(x = title , y = vote_count)) +
  coord_flip() +
  labs(
    title = "Top 10 Most Voted Movies", x = "Title", y = "Votes"
  )
