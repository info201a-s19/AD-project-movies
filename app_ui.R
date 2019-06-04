library("ggplot2")
library("plotly")

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
      plotlyOutput(outputId = "my_chart")
    )
  )
)

page_two <- tabPanel(
  "Zhi Ye, Jody, or Lynette", # label for the tab in the navbar
  titlePanel("title goes here"),
  
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        inputId = "chart_type",
        label = "Revenue or Budget by Year",
        choices = c("Revenue",
                    "Budget"
        )
    )
  ),
  mainPanel(
    plotlyOutput(outputId = "revbudg_chart")
  )
  )
)

page_three <- tabPanel(
  "Zhi Ye, Jody, or Lynette", # label for the tab in the navbar
  titlePanel("title goes here"),
  
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        inputId = "chart_type",
        label = "Revenue or Budget by Year",
        choices = c("Revenue",
                    "Budget"
        )
      )
    ),
    mainPanel(
      plotlyOutput(outputId = "revbudg_chart")
    )
  )
)


# Pass each page to a multi-page layout (`navbarPage`)
ui <- navbarPage(
  "My Application", # application title
  page_one, # include the first page content
  page_two, # include the second page content
  page_three
)