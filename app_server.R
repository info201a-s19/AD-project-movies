library("shiny") # Load shiny
library("dplyr") # Load dplyr
library("tidyr") # Loads tidyr
library("leaflet") # Load leaflet
library("ggplot2") # Load ggplot2

movies_dataset <- read.csv("data/movies_metadata.csv", stringsAsFactors = FALSE)


# Create a server function that display visualizations with labels.
server <- function(input, output) {
  # Creates a scatterplot
  output$scatter <- renderPlot({
    xvar_name_one <- names(yxaxis_var_one)[yxaxis_var_one == input$x_var_one]
    yvar_name_one <- names(yxaxis_var_one)[yxaxis_var_one == input$y_var_one]
    title <- paste0(xvar_name_one, " v.s. ", yvar_name_one)
   
     p <- ggplot(movies_dataset) +
      geom_point(
        mapping = aes_string(x = input$x_var_one, y = input$y_var_one),
        size = input$size_one,
        color = input$color_one
      ) +
      labs(x = xvar_name_one, y = yvar_name_one, title = title)
    p
  })
}