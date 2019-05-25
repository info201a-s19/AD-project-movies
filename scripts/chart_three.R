library("dplyr")
library("ggplot2")
options(scipen = 999)

# What is the top 10 most common single and mixed genre for all kinds
# of movies that have been released before?
popular_genre <- function(df) {
  most_common_genre <- df %>%
    group_by(genres) %>%
    summarize(number_of_genre = n()) %>%
    filter(genres != "(no genres listed)") %>%
    arrange(number_of_genre) %>%
    mutate(order = factor(genres, genres)) %>%
    top_n(10)

  chart <- ggplot(data = most_common_genre) +
    geom_point(
      mapping = aes(x = number_of_genre, y = order),
      color = "purple",
      alpha = .7,
      size = 6
    ) +
    labs(
      title = "Most Popular Single/Multiple Movie Genre Chart",
      x = "Count", y = "Genre Type"
    )
  return(chart)
}
