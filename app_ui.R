library("plotly")
library("shiny") # Load shiny
library("dplyr") # Load dplyr
library("tidyr") # Loads tidyr
library("leaflet") # Load leaflet
library("ggplot2") # Load ggplot2


page_one <- tabPanel(
  "Jeff Zhao",
  titlePanel("Revenue and Budget by Year"),
  
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      
      # Radio buttons to adjust data based on race
      radioButtons(
        inputId = "rev_or_budget",
        label = "Revenue or Budget by Year",
        choices = c("Revenue",
          "Budget"
        )
      )
      # Checkbox for metro vs. rural coloring
    ),
    
    # Includes interactive plotly chart and html message
    mainPanel(
      plotOutput(outputId = "my_chart")
    )
  )
)


# Pass each page to a multi-page layout (`navbarPage`)
ui <- navbarPage(
  "My Application", # application title
  page_one
)