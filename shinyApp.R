# Load the necessary library
library(shiny)

# Define UI components
ui <- fluidPage(
  
  # Application title
  titlePanel("CourseKata: Enhancing Education"),
  
  # Sidebar layout with input controls
  sidebarLayout(
    sidebarPanel(
      # Input: Slider for the number of observations
      sliderInput("obs", "Number of observations:",
                  min = 1, max = 1000, value = 500)
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      # Plot output
      plotOutput("plot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Reactive expression to generate random data based on input
  generatedData <- reactive({
    data <- data.frame(x = rnorm(input$obs))
    data
  })
  
  # Render plot based on the generated data
  output$plot <- renderPlot({
    data <- generatedData()
    hist(data$x, main = "Histogram of Random Data",
         xlab = "Value of X", col = "skyblue", border = "white")
  })
}

# Run the application
shinyApp(ui = ui, server = server)
