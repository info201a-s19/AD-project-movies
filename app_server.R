library("ggplot2")
library("plotly")
library("dplyr")
library("tidyverse")

server <- function(input, output) {
  df <- read.csv("data/movies_metadata.csv", stringsAsFactors = FALSE)
  df$numeric_budget <- as.numeric(as.character(df$budget))
  budget_df <- df %>%
    mutate(year = as.numeric(substring(release_date, 1, 4))) %>%
    group_by(year) %>%
    summarize(max_budget = max(numeric_budget, na.rm = TRUE)) %>%
    filter(max_budget != 0) %>%
    filter(str_count(year) == 4)
  
  output$my_chart <- renderPlotly({
    by_year <- ggplot(data = budget_df) +
      geom_col(mapping = aes(x = year, y = max_budget)) +
      coord_flip() +
      theme(axis.ticks = element_blank(), plot.background = element_blank(),
            panel.border = element_blank())
    
        # Return plotly interactive scatter plot Page 1
        return(ggplotly(by_year))              
  })
}

