library(shiny)

ui <- fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"),
    tags$script(HTML('
      $(document).ready(function() {
        $("#tabs").on("shown.bs.tab", function(event) {
          var tab = $(event.target).attr("href");
          $(tab).addClass("animate__animated animate__flip");
          $(tab).one("animationend", function() {
            $(tab).removeClass("animate__animated animate__flip");
          });
        });
      });
    '))
  ),
  fluidRow(
    column(width = 8,
           tabsetPanel(
             id = "tabs",
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
}

shinyApp(ui, server)


