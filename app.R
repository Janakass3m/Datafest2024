library(shiny)

ui <- fluidPage(
  setBackgroundColor(color = c("#B8E2F2", "#ede2f0", "#ffffff"),
  gradient = "linear", 
  direction = "bottom" 
  ),
  tags$head(
    tags$style(HTML("
      /* Custom CSS to increase paragraph font size */
        p {
          font-size: 18px; 
        }
        
        /* CSS for page-turning animation */
        .tabset > .tab-content {
          position: relative;
          overflow: hidden;
        }
        .tabset > .tab-content > .tab-pane {
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          transition: transform 0.5s ease-in-out;
        }
        .tabset > .tab-content > .tab-pane.active {
          transform: translateX(0%);
        }
        .tabset > .tab-content > .tab-pane.fade {
          transform: translateX(100%);
        }
      ")
  ),
  fluidRow(
    column(width = 8,
      tabsetPanel(
        id = "mainTabset",
        tabPanel("Table of Contents",
                 h2("Table of Contents"),
                 p("Introduction"),
                 actionButton("btn1", "Click to access the Introduction",style = "background-color: #ede2f0;"),
                 p("Analysis"),
                 actionButton("btn2", "Click to access the Analysis",style = "background-color: #ede2f0;"),
                 p("Conclusion"),
                 actionButton("btn3", "Click to access the Conclusion",style = "background-color: #ede2f0;")),
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
))
  )
)


server <- function(input, output, session) {
  observeEvent(input$btn1, {
    # Switch to Tab 2 when the button is clicked
    updateTabsetPanel(session, inputId = "mainTabset", selected = "Introduction")
  })
  observeEvent(input$btn1, {
    # Switch to Tab 2 when the button is clicked
    updateTabsetPanel(session, inputId = "mainTabset", selected = "Introduction")
  })

}

shinyApp(ui, server)