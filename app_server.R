library("ggplot2")
library("plotly")
library("dplyr")
library("tidyverse")
library("shiny") # Load shiny
library("tidyr") # Loads tidyr
options(scipen = 999)

server <- function(input, output) {
  df <- read.csv("data/movies_metadata.csv", stringsAsFactors = FALSE)
  tmbd_df <- read.csv("data/tmdb_movies_data.csv", stringsAsFactors = FALSE)
  
  df$numeric_budget <- as.numeric(as.character(df$budget))
  df$numeric_rev <- as.numeric(as.character(df$revenue))
  bud_rev_df <- df %>%
    mutate(year = as.numeric(substring(release_date, 1, 4))) %>%
    group_by(year) %>%
    summarize(max_budget = max(numeric_budget, na.rm = TRUE)/1000000, 
              max_rev = max(numeric_rev, na.rm = TRUE)/1000000) %>%
    filter(str_count(year) == 4)
  
  output$my_chart <- renderPlotly({
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
        return(ggplotly(by_year))              
  })
  
  # Create a server function that display visualizations with labels.
  # Creates a scatterplot
  output$scatter <- renderPlot({
    xvar_name_one <- names(yxaxis_var_one)[yxaxis_var_one == input$x_var_one]
    yvar_name_one <- names(yxaxis_var_one)[yxaxis_var_one == input$y_var_one]
    title <- paste0(xvar_name_one, " v.s. ", yvar_name_one)
    
    p <- ggplot(tmbd_df) +
      geom_point(mapping = aes_string(x = input$x_var_one, y = input$y_var_one), alpha = (1 / 10),
                 size = input$size_one,
                 color = input$color_one
                 ) +
      #scale_x_continuous(breaks = seq(0, max(input$x_var_one), 20)) +
      #scale_y_continuous(breaks = seq(0, max(input$y_var_one), 500000000)) +
      labs(
        title = title,
        x = xvar_name_one, y = yvar_name_one
      )
    p
  })
  
  top_10_df <- tmbd_df %>%
    arrange(-revenue_adj) %>%
    top_n(10, wt = revenue_adj) %>%
    mutate(original_title = factor(original_title, original_title)) 
  
  output$test <- renderPlot({
    y_axis_select <- switch(input$y_var_three,
                            "Budget" = top_10_df[["budget_adj"]],
                            "Revenue" = top_10_df[["revenue_adj"]],
                            "Runtime" = top_10_df[["runtime"]],
                            "Votes Count" = top_10_df[["vote_count"]],
                            "Vote Average" = top_10_df[["vote_average"]],
                            "Popularity" = top_10_df[["popularity"]],
                            "Year" = top_10_df[["release_year"]])
    y_axis_name <- switch(input$y_var_three,
                          "Budget" = "($) Budget",
                          "Revenue" = "($) Revenue",
                          "Runtime" = "(min) Runtime",
                          "Votes Count" = "# of Votes",
                          "Vote Average" = "Vote Average",
                          "Popularity" = "Popularity",
                          "Year" = "Release Year")
  q <- ggplot(top_10_df, aes(x = original_title, y = y_axis_select)) +
    geom_point(size = 3, color = input$color_three) +
    geom_segment(aes(
      x = original_title,
      xend = original_title,
      y = 0,
      yend = y_axis_select
    )) +
    labs(
      title = "Top 10 Most Voted Movies",
      x = "Movie Titles",
      y = y_axis_name
    ) +
    theme(axis.text.x = element_text(angle = 65, vjust = 0.5))
  q
  })
}

