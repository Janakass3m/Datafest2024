library(shiny)

ui <- fluidPage(
  tags$video(src = "videos\\Purple animated tech festival promo instagram post.mp4", type = "video/mp4", controls = TRUE, width = "100%", height = "100%")
)

server <- function(input, output, session) {
  addResourcePath(prefix = "videos", directoryPath = 'C:\\Users\\rsaqu\\Downloads')
}

shinyApp(ui, server)


