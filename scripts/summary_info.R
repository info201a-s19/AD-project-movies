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

movies_metadata <- read.csv("data/movies_metadata.csv",
                            stringsAsFactors = FALSE)

# A function that takes in a dataset and returns a list of info about it:
get_summary_info <- function(dataset) {
  ret <- list()
  ret$longest_runtime <- dataset %>%
    select(runtime, title) %>%
    arrange(-runtime) %>%
    top_n(1, runtime) %>%
    pull(runtime)
  ret$name_longest_runtime <- dataset %>%
    select(runtime, title) %>%
    arrange(-runtime) %>%
    top_n(1, runtime) %>%
    pull(title)
  ret$highest_vote_count <- dataset %>%
    select(vote_count, title, tagline) %>%
    arrange(-vote_count) %>%
    top_n(1, vote_count) %>%
    pull(title)
  ret$highest_vote_count_tagline <- dataset %>%
    select(vote_count, title, tagline) %>%
    arrange(-vote_count) %>%
    top_n(1, vote_count) %>%
    pull(tagline)
  ret$top_3_revnue_titles <- dataset %>%
    select(revenue, title) %>%
    arrange(-revenue) %>%
    top_n(3, revenue) %>%
    pull(title)
  return (ret)
}

# Demonstrate that your function works by passing the dataset into it
# and saving the result in a variable
summary_metadata <- get_summary_info(movies_metadata)