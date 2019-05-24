# Midpoint Deliverable
# Team AD
# Info 201

library(dplyr)

# Summary Information -------------------------------------------------------
# Calculate the longest runtime in the movies_metadata data file.
# Calculate the name of the longest runtime
# Calculate the highest vote count's movie
# Calculate the tagline of the highest vote  count
# Caclulate the top 3 highest revenue's titles
# A function that takes in a dataset and returns a list of info about it:
get_summary_info <- function(dataset) {
  ret <- list()
  
  longest_runtime <- dataset %>%
    select(runtime, title) %>%
    arrange(-runtime) %>%
    top_n(1, runtime) %>%
    pull(runtime)
  
  name_longest_runtime <- dataset %>%
    select(runtime, title) %>%
    arrange(-runtime) %>%
    top_n(1, runtime) %>%
    pull(title)
  
  highest_vote_count <- dataset %>%
    select(vote_count, title, tagline) %>%
    arrange(-vote_count) %>%
    top_n(1, vote_count) %>%
    pull(title)
  
  highest_vote_count_tagline <- dataset %>%
    select(vote_count, title, tagline) %>%
    arrange(-vote_count) %>%
    top_n(1, vote_count) %>%
    pull(tagline)
  
  top_3_revnue_titles <- dataset %>%
    select(revenue, title) %>%
    arrange(-revenue) %>%
    top_n(3, revenue) %>%
    pull(title)
  
  ret$longest_runtime <- longest_runtime
  ret$name_longest_runtime <- name_longest_runtime
  ret$highest_vote_count <- highest_vote_count
  ret$highest_vote_count_tagline <- highest_vote_count_tagline
  ret$top_3_revenue_titles <- top_3_revenue_titles
  
  return (ret)
}
