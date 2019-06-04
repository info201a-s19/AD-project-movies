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


# Create x and y variables for page two
yxaxis_var_one <- list(
  "Budget" = "budget",
  "Revenue" = "revenue",
  "Runtime" = "runtime",
  "Votes Count" = "vote_count",
  "Vote Average" = "vote_average"
)

# Define the first page content; uses tabPanel, sidebarLayout, 
# sidebarPanel, selectInput, mainPanel, etc. 
page_two <- tabPanel(
  "Zhi Ye", # label for the tab in the navbar
  titlePanel("Zhi Ye"), # show with a displayed title
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "x_var_one",
        label = "X Variable",
        choices = yxaxis_var_one,
        selected = "vote_average"
      ),
      selectInput(
        "y_var_one",
        label = "Y Variable",
        choices = yxaxis_var_one,
        selected = "vote_count"
      ),
      selectInput(
        "color_one",
        label = "Color",
        choices = list("Blue" = "blue", "Green" = "green", "Red" = "red")
      ),
      size_input <- sliderInput(
        "size_one",
        label = "Size of point", min = 1, max = 10, value = 2
      )
    ),
    mainPanel(
      plotOutput("scatter")
    )
  )
)


# Pass each page to a multi-page layout (`navbarPage`)
ui <- navbarPage(
  "My Application", # application title
  page_one,
  page_two
)