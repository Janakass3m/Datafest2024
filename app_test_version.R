library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(
      HTML("
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
    )
  ),
  fluidRow(
    column(width = 8,
           tabsetPanel(
             id = "tabs", # added this to turn pages and keep tab of them
             tabPanel("Title Page",
                      h2(""),
                      p(""),
                      actionButton("btn1", "A Button on Page 1")),
             tabPanel("Page 2",
                      h2("This is page 2"),
                      plotOutput("plot1")),
             tabPanel("Page 3",
                      h2("This is page 3"),
                      dataTableOutput("table1"))
           )
    )
  ),
  fluidRow(
    column(width = 4,
           wellPanel(
             h4("Additional Information"),
             HTML("<p>Here we can put more information on our analysis or something, we can add fun facts or smth, anything to fill the space adn make this look better. 
                  Here we can put more information on our analysis or something, we can add fun facts or smth, anything to fill the space adn make this look better.
                  Here we can put more information on our analysis or something, we can add fun facts or smth, anything to fill the space adn make this look better.
                  Here we can put more information on our analysis or something, we can add fun facts or smth, anything to fill the space adn make this look better.</p>")
           ),
           style = "height: 450px; overflow-y: auto; background-color: #b8e2f2; border: 1px solid #007bff; border-radius: 5px; padding: 15px;"
    )
  )
)


server <- function(input, output, session) {
  output$plot1 <- renderPlot({
    hist(rnorm(100))
  })
  
  output$table1 <- renderDataTable({
    data.frame(A = rnorm(10), B = rnorm(10))
  })
  
  observe({ # updates tab when page is turned so app knows which part it is on
    if (!is.null(input$tabs)) {
      selected_tab <- input$tabs
      selected_tab <- gsub(".*-", "", selected_tab)
      updateTabsetPanel(session, "tabs", selected = selected_tab)
    }
  })
}

shinyApp(ui, server)

