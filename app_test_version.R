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
      .tab-content {
        overflow: hidden; /* Hide overflow content */
        position: relative; /* Set position to relative */
      }
      .tab-panel {
        position: absolute; /* Set position to absolute */
        width: 100%; /* Set width to 100% */
        transition: transform 0.5s; /* Add transition for smooth animation */
      }
      .tab-panel.active {
        transform: translateX(0); /* Move the active panel to the center */
      }
      .tab-panel.inactive-left {
        transform: translateX(-100%); /* Move the inactive panel to the left */
      }
      .tab-panel.inactive-right {
        transform: translateX(100%); /* Move the inactive panel to the right */
      }
    "))
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
                      actionButton("btn2", "Click to access the Analysis",style = "background-color:#B8E2F2;"),
                      p("Conclusion"),
                      actionButton("btn3", "Click to access the Conclusion",style = "background-color: #B8E2F2;")),
             tabPanel("Introduction",
                      h2("Introduction"),
                      p("Introduction"),
                      class = "tab-panel"
             ),
             tabPanel("Analysis",
                      h2("Analysis"),
                      p("Analysis"),
                      class = "tab-panel"
             ),
             tabPanel("Conclusion",
                      h2("Conclusion"),
                      p("Conclusion"),
                      class = "tab-panel"
             )
           )
    ))
)


server <- function(input, output, session) {
  observeEvent(input$btn1, {
    # Add classes to handle animation
    updateTabsetPanel(session, inputId = "mainTabset", selected = "Introduction")
    shinyjs::delay(500, shinyjs::runjs('$(".tab-panel").removeClass("active inactive-left inactive-right"); $(".tab-panel:not(.active)").addClass("inactive-left"); $(".tab-panel.active").addClass("inactive-right");'))
  })
  observeEvent(input$btn2, {
    # Add classes to handle animation
    updateTabsetPanel(session, inputId = "mainTabset", selected = "Analysis")
    shinyjs::delay(500, shinyjs::runjs('$(".tab-panel").removeClass("active inactive-left inactive-right"); $(".tab-panel:not(.active)").addClass("inactive-left"); $(".tab-panel.active").addClass("inactive-right");'))
  })
  observeEvent(input$btn3, {
    # Add classes to handle animation
    updateTabsetPanel(session, inputId = "mainTabset", selected = "Conclusion")
    shinyjs::delay(500, shinyjs::runjs('$(".tab-panel").removeClass("active inactive-left inactive-right"); $(".tab-panel:not(.active)").addClass("inactive-left"); $(".tab-panel.active").addClass("inactive-right");'))
  })
  
}

shinyApp(ui, server)




