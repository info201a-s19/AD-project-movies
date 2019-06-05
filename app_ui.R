library("plotly")
library("shiny") # Load shiny
library("dplyr") # Load dplyr
library("tidyr") # Loads tidyr
library("leaflet") # Load leaflet
library("ggplot2") # Load ggplot2


page_one <- tabPanel(
  "Revenue/Budget (Year)",
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
      ),
      selectInput(
        "color_one",
        label = "Color",
        choices = list("Black" = "black",
                       "Purple" = "purple",
                       "Gold" = "gold",
                       "Red" = "red",
                       "Dark Green" = "darkgreen")
      )
      # Checkbox for metro vs. rural coloring
    ),
    
    # Includes interactive plotly chart and html message
    mainPanel(
      plotlyOutput(outputId = "my_chart")
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
  "Scatterplots", # label for the tab in the navbar
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
        "color_two",
        label = "Color",
        choices = list("Black" = "black",
                       "Purple" = "purple",
                       "Gold" = "gold",
                       "Red" = "red",
                       "Dark Green" = "darkgreen")
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


# Define the third page content; uses tabPanel, sidebarLayout, 
# sidebarPanel, selectInput, mainPanel, etc. 
page_three <- tabPanel(
  "Top 10 Movies", # show with a displayed title
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "y_var_three",
        label = "Y Variable",
        choices = c("Budget",
        "Revenue",
        "Runtime",
        "Votes Count",
        "Vote Average",
        "Popularity",
        "Year"),
        selected = "budget_adj"
      ),
      selectInput(
        "color_three",
        label = "Color",
        choices = list("Black" = "black",
                       "Purple" = "purple",
                       "Gold" = "gold",
                       "Red" = "red",
                       "Dark Green" = "darkgreen")
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
    h1("Summary"),
    h2("Budget/Renevues Analysis"),
    p("Throughout the assignment, our group noticed some fascinating things
    regarding the movies dataset that we have been working with. From one of
    our main takeaways, there was an interesting increase within movie budgets
    and revenues that have increased over the time in years. This was also
    prelevant within the first interactive chart, which shows the actual
    increase of the budgets and revenues over time. "),
    h2("Revenue, Budget, and Popularity Conclusions"),
    p("Our second conclusion consists of revenue, budget, and popularity and 
      the correlation that is connected with these three variables. From the
      aspect that revenue and popularity have a positive correlation, and also
      so does the budget and popularity. All of these equates to the fact that
      a more money that is spent or made upon a movie, would also have a
      higher popularity, which gains more popularity."),
    h2("Top 10 Movies Takeaway"),
    p("Within the top 10 movies that were highly rated, it came to our
    relization that majority of the movies were made fairly recently (within 
    the past 20 years). Although the whole movie dataset actually contained
    movies from 1900s until the 2000s from the aggregated database, we can
    implicate that the modernization has increased over time as well as 
    the technological advances that can track the amount of votes within the
    movie industry. Also, the improvement of the movie dataset gained quality
    over time, as the most recent data has a better record of voting."),
    h2("Conclusion"),
    p("Within the whole movie dataset, our team learned a lot about movies and
      how they impact society. From the financial aspects such as budgeting, to
      the impact of popularity and vote counts,movies contain a vital role
      within social media and society. This dataset helped us understand
      the true importance of movies and how their data can affect society.")
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