library("dplyr") # Loads dplyr
library("tidyr") # Loads tidyr
library("ggplot2") # Loads ggplot2


# What are the top 10 most voted movies?
top_10 <- function(df) {
  top_10_df <- df %>%
    group_by(title) %>%
    summarise(vote_count = sum(vote_count), na.rm = TRUE) %>%
    top_n(10, wt = vote_count) %>%
    arrange(vote_count) %>%
    mutate(title = factor(title, title))
  # Plot
  plot <- ggplot(top_10_df, aes(x = title, y = vote_count)) +
    geom_point(size = 3) +
    geom_segment(aes(
      x = title,
      xend = title,
      y = 0,
      yend = vote_count
    )) +
    labs(
      title = "Top 10 Most Voted Movies",
      x = "Movie Titles",
      y = "Number of Votes"
    ) +
    theme(axis.text.x = element_text(angle = 65, vjust = 0.5))
  return(plot)
}
