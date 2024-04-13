library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(
      HTML("
        /* Custom CSS to increase paragraph font size */
        p {
          font-size: 18px; /* Adjust the font size as needed */
        }
      ")
    )
  ),
  fluidRow(
    column(width = 8,
      tabsetPanel(
        tabPanel("Introduction",
                 h2("Introduction to Our Analysis"),
                 p("CourseKata is a platform that creates and publishes a series of e-books for introductory statistics 
                   and data science classes.The developers of CourseKata, Jim Stigler and Ji Son, utilize psychologically 
                   founded learning strategies in order to enhance the learning environment of CourseKata. We took the data 
                   collected from students of various learning levels and at several different learning institutions
                   and have provided advancements/improvements that can be made to CourseKata's teaching methods to increase student 
                   engagement. "),
                 actionButton("btn1", "A Button on Page 1")),
        tabPanel("Page 2",
                 h2("This is page 2"),
                 plotOutput("plot1")),
        tabPanel("Page 3",
                 h2("This is page 3"),
                 dataTableOutput("table1"))
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
)


server <- function(input, output, session) {
  output$plot1 <- renderPlot({
    hist(rnorm(100))
  })
  
  output$table1 <- renderDataTable({
    data.frame(A = rnorm(10), B = rnorm(10))
  })
}

shinyApp(ui, server)