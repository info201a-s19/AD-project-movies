library("plotly") # Load plotly
library("shiny") # Load shiny
library("dplyr") # Load dplyr
library("tidyr") # Loads tidyr
library("leaflet") # Load leaflet
library("ggplot2") # Load ggplot2

introduction <- tabPanel(   
  "Home",
  headerPanel("Project Overview"),

# Create introduction page with tabPanel and mainPanel. Additionally, 
# add the purpose of the project, along with sources and an image.
  mainPanel(
    h2("Final Project: The Cinematic Universe"),
    p("Jeffrey Zhao, Jody Wong, Lynette Li, Zhi Ye"),
    p("5/22/2019"),
    img(src = "./imgs/info201avengers.png", width = 720, height = 400),
    p("Our synergy in our introductory group discussions brought
       us to a shared interest in movies and their back-end processes
       and facts. Thus, we decided to explore datasets regarding Movies.
       Jody enjoys comedies. Lynette and Jeffrey revel in action movies,
       especially MCU's Avengers. All in the while, Zhi appreciates
       romance. There is more than beneath the eye of paying for a movie
       stub at the theater as there are many components before and after
       movie releases. Some pre-release factors consisting of budgeting,
       timeline, and production planning enhance the quality and
       enjoyability of the movie. While, a few post-factors incorporate
       ratings, price, marketing, and theater distribution network - all
       of which aim to drive long-term profitability and to attract a
       global audience. We are motivated to analyze movie trends,
       statistics, and logistics such as calculating the highest
       revenue and budget by year, comparing runtime v.s. budget/revenue/etc,
       comparing vote average v.s. vote count, and many more comparisions.
       Moreover, we've analyzed the top 10 most voted movies to find the
       budget, revenue, runtime, vote count, vote average, popularity, and
       release year that are associated with them."),
    p(
      "We began our research by viewing", a("Rounak Banik's movie dataset",
        href = "https://www.kaggle.com/rounakbanik/the-movies-dataset/version/7"
      ),
      "who was interested in performing analysis and storytelling about
       the movies and its components. From that, he built a revenue
       forecasting model, determined success metrics, and crafted a
       recommender system for movies. The data source originates from
       an ensemble of data collected from TMDB and GroupLens. The Movie
       Details, Credits and Keywords have been collected from the TMDB Open
       API. Their API provides additional information on other movies,
       actors and actresses, crew members, and TV shows. The main Movies
       Metadata file contains information on 45,000 movies featured in
       the Full MovieLens dataset. Features include posters, backdrops,
       budget, revenue, release dates, languages, production countries
       and companies. Additionally, we researched and utilized",
      a("Juzer Shakir's movie dataset",
        href = "https://www.kaggle.com/juzershakir/tmdb-movies-dataset"
      ),
      "who investigated datasets for 10K+ movies from
       The Movie Database(TMDb). Shakir initially created his dataset
       to discover which movies had the highest profits and hits.
       But, overtime, he found that he wanted to learn more about the
       characteristics of movies and what similarities they had. This
       resulted in the current features that Shakir offers in his
       dataset: id, imbd_id, popularity, budget, revenue, original_title,
       cast, homepage, director, tagline, keywords, overview, runtime,
       genres, production_companies, release_date, vote_count,
       vote_average, release_year, budget_adj, and revenue_adj."
    )
  )
)


# Define the first page content; uses tabPanel, sidebarLayout,
# sidebarPanel, radioButtons, mainPanel, titlePanel, selectInput etc.
page_one <- tabPanel(
  "Revenue/Budget (Year)",
  headerPanel("Revenue/Budget"),
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      # Radio buttons to adjust data based on race
      radioButtons(
        inputId = "rev_or_budget",
        label = "Revenue or Budget by Year",
        choices = c(
          "Revenue",
          "Budget"
        )
      ),
      selectInput(
        "color_one",
        label = "Color",
        choices = list(
          "Black" = "black",
          "Purple" = "purple",
          "Gold" = "gold",
          "Red" = "red",
          "Dark Green" = "darkgreen"
        )
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

# Define the second page content; uses tabPanel, sidebarLayout,
# sidebarPanel, mainPanel, titlePanel, selectInput etc.
page_two <- tabPanel(
  "Comparisons via Scatterplot", # label for the tab in the navbar
  headerPanel("Comparisons via Scatterplot"), # show with a displayed title
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "x_var_one",
        label = "X Variable",
        choices = c(
          "Budget", "Revenue", "Runtime", "Votes Count",
          "Vote Average", "Popularity"
        ),
        selected = "Runtime"
      ),
      selectInput(
        "y_var_one",
        label = "Y Variable",
        choices = c(
          "Budget", "Revenue", "Runtime", "Votes Count",
          "Vote Average", "Popularity"
        ),
        selected = "Revenue"
      ),
      selectInput(
        "color_two",
        label = "Color",
        choices = list(
          "Black" = "black",
          "Purple" = "purple",
          "Gold" = "gold",
          "Red" = "red",
          "Dark Green" = "darkgreen"
        )
      ),
      size_input <- sliderInput(
        "size_one",
        label = "Size of Point", min = 1, max = 10, value = 2
      )
    ),
    mainPanel(
      plotlyOutput("scatter")
    )
  )
)


# Define the third page content; uses tabPanel, sidebarLayout,
# sidebarPanel, mainPanel, titlePanel, selectInput etc.
page_three <- tabPanel(
  "Top 10 Movies",
  headerPanel("Top 10 Most Voted Movies"), # show with a displayed title
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "y_var_three",
        label = "Y Variable",
        choices = c(
          "Budget",
          "Revenue",
          "Runtime",
          "Votes Count",
          "Vote Average",
          "Popularity",
          "Year"
        ),
        selected = "budget_adj"
      ),
      selectInput(
        "color_three",
        label = "Color",
        choices = list(
          "Black" = "black",
          "Purple" = "purple",
          "Gold" = "gold",
          "Red" = "red",
          "Dark Green" = "darkgreen"
        )
      )
    ),
    mainPanel(
      plotlyOutput("lollipop")
    )
  )
)


# Create the summary conclusion page with tabPanel and mainPanel.
# Additionally, add an image, descriptions, specific piece of data,
# and a broad implication for the takeaways. 
summary_page <- tabPanel(
  "Summary",
  headerPanel("Summary"),
  mainPanel(
    img(src = "./imgs/summarytakeaways.png", width = 720, height = 400),
    h3("Budget/Renevues Analysis"),
    p("Throughout the assignment, our group noticed some fascinating things
    regarding the movies dataset that we have been working with. From one of
    our main takeaways, there was an interesting increase within movie budgets
    and revenues that have increased over the time in years. This was also
    prelevant within the first interactive chart, which shows the actual
    increase of the budgets and revenues over time. "),
    h3("Revenue, Budget, and Popularity Conclusions"),
    p("Our second conclusion consists of revenue, budget, and popularity and
the correlation that is connected with these three variables. From the
      aspect that revenue and popularity have a positive correlation, and also
      so does the budget and popularity. All of these equates to the fact that
      a more money that is spent or made upon a movie, would also have a
      higher popularity, which gains more popularity."),
    h3("Top 10 Movies Takeaway"),
    p("Within the top 10 movies that were highly rated, it came to our
    relization that majority of the movies were made fairly recently (within
    the past 20 years). Although the whole movie dataset actually contained
    movies from 1900s until the 2000s from the aggregated database, we can
    implicate that the modernization has increased over time as well as
    the technological advances that can track the amount of votes within the
    movie industry. Also, the improvement of the movie dataset gained quality
    over time, as the most recent data has a better record of voting."),
    h3("Conclusion"),
    p("Within the whole movie dataset, our team learned a lot about movies and
      how they impact society. From the financial aspects such as budgeting, to
      the impact of popularity and vote counts,movies contain a vital role
      within social media and society. This dataset helped us understand
      the true importance of movies and how their data can affect society.")
  )
)


# Pass each page to a multi-page layout (`navbarPage`)
ui <- navbarPage(
  "Final Deliverable", # application title
  introduction,
  page_one,
  page_two,
  page_three,
  summary_page,
  theme = "bootstrap.css"
)
