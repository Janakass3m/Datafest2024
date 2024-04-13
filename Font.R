library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=League+Spartan&display=swap');

      body {
        font-family: 'League Spartan', sans-serif; /* Use the custom font */
      }
    "))
  ),
  
  mainPanel(
    h1("This is a header with the custom font"),
    p("This is a paragraph with the custom font")
  )
)

server <- function(input, output) {
  # Server logic goes here
}

shinyApp(ui, server)

