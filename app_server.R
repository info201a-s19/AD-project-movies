library("ggplot2")
library("plotly")
library("dplyr")
library("tidyverse")
options(scipen = 999)

server <- function(input, output) {
  df <- read.csv("data/movies_metadata.csv", stringsAsFactors = FALSE)
  df$numeric_budget <- as.numeric(as.character(df$budget))
  df$numeric_rev <- as.numeric(as.character(df$revenue))
  bud_rev_df <- df %>%
    mutate(year = as.numeric(substring(release_date, 1, 4))) %>%
    group_by(year) %>%
    summarize(max_budget = max(numeric_budget, na.rm = TRUE)/1000000, 
              max_rev = max(numeric_rev, na.rm = TRUE)/1000000) %>%
    filter(str_count(year) == 4)
  
  output$my_chart <- renderPlot({
    y_axis_select <- switch(input$rev_or_budget,
                            "Revenue" = bud_rev_df[["max_rev"]],
                            "Budget" = bud_rev_df[["max_budget"]])
    chart_title_select <- switch(input$rev_or_budget,
                                 "Revenue" = "Highest Revenue Per Year",
                                 "Budget" = "Highest Budget Per Year")
    
    by_year <- ggplot(data = bud_rev_df) +
      geom_col(mapping = aes(x = year, y = y_axis_select)) +
      coord_flip() +
      theme(
        axis.ticks = element_blank(),
        plot.background = element_blank(),
        panel.border = element_blank()
      ) +
      scale_x_continuous(breaks = seq(1900, 2020, 5)) +
      labs(
        title = chart_title_select,
        x = "Year", y = "($M)"
      )
        return(by_year)              
  })
}


