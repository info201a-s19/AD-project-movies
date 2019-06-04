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
  "Budget" = "budget_adj",
  "Revenue" = "revenue_adj",
  "Runtime" = "runtime",
  "Votes Count" = "vote_count",
  "Vote Average" = "vote_average",
  "Popularity" = "popularity"
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
        selected = "runtime"
      ),
      selectInput(
        "y_var_one",
        label = "Y Variable",
        choices = yxaxis_var_one,
        selected = "revenue"
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

tmbd_df <- read.csv("data/tmdb_movies_data.csv", stringsAsFactors = FALSE)

top_10_df <- tmbd_df %>%
  group_by(original_title) %>%
  summarise(revenue_adj = sum(revenue_adj), na.rm = TRUE) %>%
  top_n(10, wt = revenue_adj) %>%
  arrange(revenue_adj) %>%
  mutate(original_title = factor(original_title, original_title))


# Create y variable for page two
yaxis_var_three <- list(
     "Budget" = "budget_adj",
     "Revenue" = "revenue_adj",
     "Runtime" = "runtime",
     "Votes Count" = "vote_count",
     "Vote Average" = "vote_average",
     "Popularity" = "popularity",
     "Year" = "release_year"
)

# Define the second page content; uses tabPanel, sidebarLayout, 
# sidebarPanel, selectInput, mainPanel, etc. 
page_three <- tabPanel(
  titlePanel("Zhi"), # show with a displayed title
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "y_var_three",
        label = "Y Variable",
        choices = yaxis_var_three,
        selected = "budget_adj"
      ),
      selectInput(
        "color_three",
        label = "Color",
        choices = list("Purple" = "purple",
                       "Orange" = "orange",
                       "Maroon" = "maroon")
      )
    ),
    mainPanel(
      plotOutput("test")
    )
  )
)

summary_page <- tabPanel(
  "Summary",
  mainPanel(
    tags$h1("Conclusion of our Data"),
    tags$p(" Our conclusion with this ejsokfjsdlkfsdkfj .....
           ")
  )
)

# Pass each page to a multi-page layout (`navbarPage`)
ui <- navbarPage(
  "My Application", # application title
  page_one,
  page_two,
  page_three,
  summary_page
)