library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=League+Spartan&display=swap');
      body {
          font-family: 'League Spartan', sans-serif; /* Use the custom font */
          font-size: 26px; /* Adjust the font size as needed */
          margin: 0; /* Remove default margin */
          padding: 0; /* Remove default padding */
          height: 100vh; /* Set full viewport height */
          background: linear-gradient(to bottom, #B8E2F2, #ede2f0, #ffffff); /* Gradient background */
      }
    ")),
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/turn.js/4.1.0/turn.min.js"),
    tags$script(HTML('
      $(document).ready(function() {
        $("#mainTabset").turn({
          width: 800,
          height: 400,
          autoCenter: true
        });
      });
    '))
  ),
  fluidRow(
    column(width = 8,
           tabsetPanel(
             id = "mainTabset",
             tabPanel("Table of Contents",
                      h2("Table of Contents"),
                      p("Introduction"),
                      actionButton("btn1", "Click to access the Introduction",style = "background-color: #B8E2F2;"),
                      p("Analysis"),
                      actionButton("btn2", "Click to access the Analysis",style = "background-color:#ede2f0;"),
                      p("Conclusion"),
                      actionButton("btn3", "Click to access the Conclusion",style = "background-color: #ffffff;")),
             tabPanel("Introduction",
                      h2("Introduction"),
                      p("Introduction"),
             ),
             tabPanel("Analysis",
                      h2("Analysis"),
                      p("Analysis"),
             ),
             tabPanel("Conclusion",
                      h2("Conclusion"),
                      p("Conclusion"),
             )
           )
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$btn1, {
    updateTabsetPanel(session, inputId = "mainTabset", selected = "Introduction")
  })
}

shinyApp(ui, server)



