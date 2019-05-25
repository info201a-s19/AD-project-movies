library("dplyr") # Loads dplyr
library("tidyr") # Loads tidyr
library("ggplot2") # Loads ggplot2


# What are the top 25 movie titles in terms of revenue?
get_summary_of_top_25 <- function(df) {
  summary_of_top_25 <- df %>%
  group_by(title) %>% 
  arrange(-revenue) %>% 
  select(title, revenue, budget, vote_average) %>% 
  head(25)
  return(summary_of_top_25)
}




